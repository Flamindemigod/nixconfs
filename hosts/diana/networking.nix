{
  config,
  pkgs,
  ...
}: {
  # Network (Hetzner uses static IP assignments, and we don't use DHCP here)
  networking.useDHCP = false;
  networking.interfaces."enp0s31f6".ipv4.addresses = [
    {
      address = "136.243.175.33";
      # Hetzner requires /32, see:
      #     https://docs.hetzner.com/robot/dedicated-server/network/net-config-debian-ubuntu/#ipv4.
      # NixOS automatically sets up a route to the gateway
      # (but only because we set "networking.defaultGateway.interface" below), see
      #     https://github.com/NixOS/nixops/pull/1032#issuecomment-2763497444
      prefixLength = 32;
    }
  ];
  networking.interfaces."enp0s31f6".ipv6.addresses = [
    {
      address = "2a01:4f8:171:2423::1";
      prefixLength = 64;
    }
  ];
  networking.defaultGateway = {
    address = "136.243.175.1";
    # Interface must be given for Hetzner networking to work, see comment above.
    interface = "enp0s31f6";
  };
  networking.defaultGateway6 = {
    address = "fe80::1";
    interface = "enp0s31f6";
  };
  networking.nameservers = ["8.8.8.8"];

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [53 80 443 25565 25564 25566 35722 3000];
    allowedUDPPorts = [53 39001];
    allowedUDPPortRanges = [
      {
        from = 4000;
        to = 4007;
      }
      {
        from = 8000;
        to = 8010;
      }
    ];
  };

  #Wireguard Setup
  networking.nat = {
    enable = true;
    externalInterface = "enp0s31f6 ";
    internalInterfaces = ["wg0"];
  };

  sops.secrets."diana/wgpriv" = {
    owner = "root";
    path = "/var/lib/sops-nix/wg/private";
  };
  sops.secrets."diana/wgflaminphonepsk" = {
    owner = "root";
    path = "/var/lib/sops-nix/wg/flamin.phone.psk";
  };
  sops.secrets."diana/wgflaminpcpsk" = {
    owner = "root";
    path = "/var/lib/sops-nix/wg/flamin.pc.psk";
  };
  networking.wg-quick = {
    interfaces = {
      wg0 = {
        address = ["10.100.0.1/24"];
        listenPort = 39001;
        privateKeyFile = config.sops.secrets."diana/wgpriv".path;
        # This allows the wireguard server to route your traffic to the internet and hence be like a VPN
        postUp = ''
          ${pkgs.iptables}/bin/iptables -A FORWARD -i %i -o enp0s31f6 -j ACCEPT
          ${pkgs.iptables}/bin/iptables -A FORWARD -i enp0s31f6 -o %i -j ACCEPT
          ${pkgs.iptables}/bin/iptables -A FORWARD -i %i -d 10.100.0.0/24 -j ACCEPT
          ${pkgs.iptables}/bin/iptables -A FORWARD -o %i -d 10.100.0.0/24 -j ACCEPT
          ${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING -o enp0s31f6 -j MASQUERADE
        '';

        # Undo the above
        preDown = ''
          ${pkgs.iptables}/bin/iptables -D FORWARD -i %i -o enp0s31f6 -j ACCEPT
          ${pkgs.iptables}/bin/iptables -D FORWARD -i enp0s31f6 -o %i -j ACCEPT
          ${pkgs.iptables}/bin/iptables -D FORWARD -i %i -d 10.100.0.0/24 -j ACCEPT
          ${pkgs.iptables}/bin/iptables -D FORWARD -o %i -d 10.100.0.0/24 -j ACCEPT
          ${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING -o enp0s31f6 -j MASQUERADE
        '';

        peers = [
          {
            publicKey = "dP0K1stTJet5qDd8Kg0CN0KgP+4VWQfYZE09CSH+OAA=";
            presharedKeyFile =
              config.sops.secrets."diana/wgflaminphonepsk".path;
            allowedIPs = ["10.100.0.2/32"];
          }
          {
            publicKey = "WcSUFE020OnV7x6aXXyH5kYfc8JBXFi+wUL7537kigE=";
            presharedKeyFile =
              config.sops.secrets."diana/wgflaminpcpsk".path;
            allowedIPs = ["10.100.0.3/32"];
          }
        ];
      };
    };
  };
}
