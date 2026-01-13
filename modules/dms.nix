{pkgs, lib, options, ...}: {
	programs.dank-material-shell = {
		enable = true;
		plugins = {
			mediaPlayer.enable = true;
		};
	};
}
