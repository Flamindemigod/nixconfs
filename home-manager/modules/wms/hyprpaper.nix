{pkgs,...}: let
	furinaCenter = pkgs.fetchurl{
	url = "https://github.com/Flamindemigod/dots/blob/6b32e6264b04de93a0f1afd1946fe30fac9f1058/hypr/Wallpapers/FurinaWallpaper.png?raw=true";
sha256 = "sha256-zBkM83YeRe+QyHHchV4sa+Vl+VaKBVUJT1sDE3eSgmE=";
};
	velLeft = pkgs.fetchurl{
	url = "https://github.com/Flamindemigod/dots/blob/2b8a615ad8dc7537ac332d21ac421f764f62ca5b/hypr/Wallpapers/CharaStudio-2023-02-11-06-49-37-Render.png?raw=true";
sha256 = "sha256-4QQ+DJ6VV2l/ysA+iwr6pqclzvslrqurhtq2l6cBCBk=";
};
	velRight = pkgs.fetchurl{
	url = "https://github.com/Flamindemigod/dots/blob/2b8a615ad8dc7537ac332d21ac421f764f62ca5b/hypr/Wallpapers/CharaStudio-2023-02-11-05-58-17-Render.png?raw=true";
sha256 = "sha256-JTUqJKzM6hifC04KLuCY+D2Cq0WQng/CVWLkJDtHmCg=";
};
in
{
 services.hyprpaper = {
	enable = true;
	settings = {
	splash = false;
	preload = [
"${furinaCenter}"
"${velLeft}"
"${velRight}"
];
	wallpaper = [
"HDMI-A-1, ${furinaCenter}"
"desc:Hewlett Packard LA1905 CNC019039F, ${velLeft}"
"desc:Hewlett Packard LA1905 CNC10108WV, ${velRight}"];
};
};
}
