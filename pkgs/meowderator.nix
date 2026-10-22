{
  pkgs,
  lib,
  ...
}: let
  python = pkgs.python313;
  pip = python.pkgs;

  venv = python.withPackages (ps:
    with ps; [
      (disnake.overrideAttrs (old: {
        version = "2.12.1";
        src = pkgs.fetchFromGitHub {
          owner = "DisnakeDev";
          repo = "disnake";
          rev = "v2.12.1";
          hash = "sha256-0tFd8GXdUM2Pja/9UHGJ1V0i3BEabUhR/7BnM2OCebc=";
        };
        nativeBuildInputs = (old.nativeBuildInputs or []) ++ [ps.hatchling ps.hatch-vcs ps.versioningit];
        dependencies = [ps.typing-extensions];
        dontCheckRuntimeDeps = true;
      }))
      typing-extensions
    ]);
  meowSrc = "/srv/Meowderator";
in {
  users.users.meowderator = {
    description = "Meowderator service user";
    home = "/srv/Meowderator";
    createHome = true;
    homeMode = "770";
    isSystemUser = true;
    group = "meowderator";
  };
  users.groups.meowderator = {};
  systemd.services.meowderator = {
    enable = true;
    description = "Meowderator";
    wantedBy = ["multi-user.target"];
    after = [
      "network.target"
    ];
    script = ''
      ${venv}/bin/python ${meowSrc}/bot.py
    '';
    path = [venv];
    serviceConfig = {
      Restart = "always";
      WorkingDirectory = "/srv/Meowderator";
      User = "meowderator";
      Group = "meowderator";
      # Hardening
      CapabilityBoundingSet = [""];
      DeviceAllow = [""];
      LockPersonality = true;
      PrivateDevices = true;
      PrivateTmp = true;
      PrivateUsers = true;
      ProtectClock = true;
      ProtectControlGroups = true;
      ProtectHome = true;
      ProtectHostname = true;
      ProtectKernelLogs = true;
      ProtectKernelModules = true;
      ProtectKernelTunables = true;
      ProtectProc = "invisible";
      RestrictAddressFamilies = [
        "AF_UNIX"
        "AF_INET"
        "AF_INET6"
      ];
      RestrictNamespaces = true;
      RestrictRealtime = true;
      RestrictSUIDSGID = true;
      SystemCallArchitectures = "native";
      UMask = "0007";
    };
  };
}
