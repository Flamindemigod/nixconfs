{
  config,
  pkgs,
  ...
}: {
  networking.nameservers = ["8.8.8.8"];
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [53 80 443 5055 25565 25564 25566 35722 3000];
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
}
