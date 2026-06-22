{
  pkgs,
  lib,
  ...
}: let
  python = pkgs.python313;
  pip = python.pkgs;

  edge_tts = pip.buildPythonPackage rec {
    pname = "edge-tts";
    version = "7.2.7";
    doCheck = true;
    pyproject = true;
    build-system = [ pip.setuptools ];
    propagatedBuildInputs = with pip; [
      typing-extensions
      srt
      aiohttp
      tabulate
      certifi
    ];

    src = pkgs.fetchFromGitHub {
      owner = "rany2";
      repo = pname;
      rev = version;
      sha256 = "sha256-KlQJ9U5RgifpqVKw5BrPwBFJYZHKibMUlyb3aX+4qf8=";
    };
  };

	dave = pip.buildPythonPackage rec {
		pname=  "dave.py";
		version = "0.1.1";
		doCheck = false;
		format = "wheel";
		src = pkgs.fetchurl {
url="https://files.pythonhosted.org/packages/d5/2d/2c4c3f66f19eb25ae97d19097b31c5405f67a841c07ac794d36a62dff8c2/dave_py-0.1.1-cp313-cp313-manylinux_2_27_x86_64.manylinux_2_28_x86_64.whl";
		hash = "sha256-E9IBETWkzOXq/UiznikADTKs5vqa+vZGrhZY0CkELCE=";
		};
	};

  venv = python.withPackages (ps:
    with ps; [
      (disnake.overrideAttrs(old: {
			version = "2.12.0";
			src = pkgs.fetchFromGitHub {
				owner = "DisnakeDev";
				repo = "disnake";
				rev = "v2.12.0";
				hash = "sha256-wNq5r5Roos6jopnVHCDArOPQbDhcDxjry7STnxXqG00=";
			};
		nativeBuildInputs = (old.nativeBuildInputs or []) ++ [ps.hatchling ps.hatch-vcs ps.versioningit];	
			dependencies = [ ps.typing-extensions  ];
			dontCheckRuntimeDeps = true; 
		}))
	  audioop-lts
	  typing-extensions
      edge_tts
      gtts
	  pynacl
	  dave
    ]);
  holoSrc = "/srv/Holo";
in {
	users.users.holo = {
		description = "Holo service user";
      	home = "/srv/Holo";
      	createHome = true;
      	homeMode = "770";
      	isSystemUser = true;
      	group = "holo";
	};
	users.groups.holo =  {};
  systemd.services.holo = {
    enable = true;
    description = "Holo is a simple vel voice stand-in";
    wantedBy = ["multi-user.target"];
    after = [
      "network.target"
    ];
    script = ''
      ${venv}/bin/python ${holoSrc}/bot_new.pyw
    '';
    path = [venv];
    serviceConfig = {
      Restart = "always";
      WorkingDirectory = "/srv/Holo";
 	User = "holo";
        Group = "holo";
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
