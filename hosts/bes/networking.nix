{
  config,
  pkgs,
  ...
}: {
  networking.useDHCP = true;
  networking.nameservers = ["8.8.8.8"];

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [];
    allowedUDPPorts = [];
    allowedUDPPortRanges = [
      # {
      #   from = 4000;
      #   to = 4007;
      # }
    ];
  };
}
