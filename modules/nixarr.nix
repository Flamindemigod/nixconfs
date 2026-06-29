{inputs, ...}: {
  imports = [ inputs.nixarr.nixosModules.default ];
  nixarr = {
    enable = true;
    mediaDir = "/srv/nixarr/media";
    stateDir = "/srv/nixarr/.state";
    
    jellyfin = {
      enable = true;
      expose.https = {
        enable = true;
        domainName = "jellyfin.flamindemigod.com";
        acmeMail = "postmaster@flamindemigod.com";
      };
    };

    transmission = {
      enable = true;
    };

    #subtitles manager
    bazarr.enable = true;

    #Music Collection
    lidarr.enable = true;

    #Movie Collection
    radarr = {
      enable = true;
      #openFirewall = true;
    };

    #TV Rss
    sonarr.enable = true;

    #indexer
    prowlarr.enable = true;

    #media request and discovery manager for Jellyfin
    seerr.enable = true;
  };

}
