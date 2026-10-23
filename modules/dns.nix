{config, ...}: {
  sops.secrets."bes/cf-token" = {
    owner = "root";
    path = "/var/lib/sops-nix/cf-token";
  };
  services.cloudflare-dyndns = {
    enable = true;
    apiTokenFile = config.sops.secrets."bes/cf-token".path;
    domains = ["flamindemigod.com" "server.flamindemigod.com" "jellyfin.flamindemigod.com"];
    ipv4 = true;
    ipv6 = false;
  };
}
