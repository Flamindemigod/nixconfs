{ stdenvNoCC
, lib
, fetchFromGitHub
, nix-update-script
, meson
, ninja
, sassc
, pkgs
}:
let
 pname = "adw-gtk3";
 version = "5.3";
   cssPath="https://raw.githubusercontent.com/rose-pine/gtk/75d087e2725386b8a3496ae2aba4d7f94e78fa80/gtk4/rose-pine.css";
   css = pkgs.fetchurl{
      url = cssPath;
      sha256 = "sha256-8ihPvRr+A+EUZRKJeIzq2bc0yYAhXJCYW56QxpcVnco=";
	};
 in
stdenvNoCC.mkDerivation rec{
name = "gtk-theme";
src = fetchFromGitHub {
    owner = "lassekongo83";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-DpJLX9PJX1Q8dDOx7YOXQzgNECsKp5uGiCVTX6iSlbI=";
  };
 nativeBuildInputs = [
    meson
    ninja
    sassc
  ];

  postPatch = ''
    chmod +x gtk/src/adw-gtk3-dark/gtk-3.0/install-dark-theme.sh
    patchShebangs gtk/src/adw-gtk3-dark/gtk-3.0/install-dark-theme.sh
  '';

  passthru = {
    updateScript = nix-update-script { };
  };

postInstall = ''
rm $out/share/themes/adw-gtk3-dark/gtk-4.0/gtk-dark.css
cp ${css} $out/share/themes/adw-gtk3-dark/gtk-4.0/gtk-dark.css
echo ":root { --standalone-color-oklab: max(l, 0.85) a b; --accent-color: oklab(from var(--accent-bg-color) var(--standalone-color-oklab)); --destructive-color: oklab(from var(--destructive-bg-color) var(--standalone-color-oklab)); --success-color: oklab(from var(--success-bg-color) var(--standalone-color-oklab)); --warning-color: oklab(from var(--warning-bg-color) var(--standalone-color-oklab)); --error-color: oklab(from var(--error-bg-color) var(--standalone-color-oklab)); }" >> $out/share/themes/adw-gtk3-dark/gtk-4.0/gtk-dark.css
echo "@import '../gtk-3.0/libadwaita.css';" >> $out/share/themes/adw-gtk3-dark/gtk-4.0/gtk-dark.css
echo "@import '../gtk-3.0/libadwaita-tweaks.css';" >> $out/share/themes/adw-gtk3-dark/gtk-4.0/gtk-dark.css
'';
}
