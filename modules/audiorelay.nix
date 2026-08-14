{pkgs, ...}: {
	environment.systemPackages = [
		(pkgs.callPackage ../pkgs/audiorelay.nix {})
	];
	networking.firewall.allowedTCPPorts = [59100];
	networking.firewall.allowedUDPPorts = [59200];
	services.pipewire.extraConfig.pipewire."91-null-sinks" = {
		"context.objects" = [
			{
				factory = "adapter";
				args = {
					"factory.name" = "support.null-audio-sink";
					"node.name" = "AudioRelayMic";
					"node.description" = "AudioRelay Microphone";
					"media.class" = "Audio/Source/Virtual";
					"audio.position" = "MONO";
					"object.linger" = true;
				};
			}
		];
	};
}
