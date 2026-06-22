#Minecraft module. not exactly pure as its a bit of a pain to manage modpacks
#properly purely in nix
{pkgs, ...}: let 
	mkServer = { enable ? true, name, desc, nf_version, }: {
		systemd.services."minecraft-server-${name}" = {
			enable = enable;
			description = desc;
			wantedBy = ["multi-user.target"];
			after = ["network.target"];
			startLimitIntervalSec = 120;
			startLimitBurst = 5;
			serviceConfig = {
				Type = "forking";
				ExecStart = lib.getExe (pkgs.writeShellApplication {
					name = "${name}-start";
					text = ''
							${pkgs.tmux}/bin/tmux -S minecraft.sock new -d \
							${pkgs.openjdk}/bin/java @user_jvm_args.txt    \
							@libraries/net/neoforged/neoforge/${nf_version}/unix_args.txt nogui
							${pkgs.tmux}/bin/tmux -S minecraft.sock server-access -aw flamin
					'';
				});
				ExecStartPost = lib.getExe (pkgs.writeShellApplication {
					name = "${name}-start-post";
					text = ''
					  ${pkgs.coreutils}/bin/chmod 666 minecraft.sock
					'';
				});
				ExecStop = lib.getExe (pkgs.writeShellApplication {
					name = "${name}-stop";
					text = ''
					  function server_running {
						${pkgs.tmux}/bin/tmux -S minecraft.sock has-session
					  }

					  if ! server_running ; then
						exit 0
					  fi

					  ${pkgs.tmux}/bin/tmux -S minecraft.sock send-keys ${lib.escapeShellArg "stop"} Enter

					  while server_running; do sleep 1s; done
					'';
				});
			TimeoutStopSec = "1min 15s";
			Restart = "always";
			WorkingDirectory = "/srv/minecraft/${name}";
			User = "minecraft";
			Group = "minecraft";

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
	};
in {
	users.groups.minecraft = {};
	users.users.minecraft = {
      description = "Minecraft server service user";
      home = "/srv/minecraft";
      createHome = true;
      homeMode = "770";
      isSystemUser = true;
      group = "minecraft";
	};
	mkServer { 
		enable = true;
		name = "ftbskies2"; 
		desc = "FTB Skies 2";
		nf_version = "21.1.230"; 
	};
}
