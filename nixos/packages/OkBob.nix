{
  lib,
  stdenv,
  fetchFromGitHub,
  makeWrapper,
  zig,
  sqlite,
  ...
}:
stdenv.mkDerivation rec {
  pname = "OkBob";
  version = "0.0.4";

  src =
    (fetchFromGitHub {
      owner = "Flamindemigod";
      repo = "OkBob";
      rev = "v0.0.4";
      fetchSubmodules = true;
      sha256 = "sha256-uDLMlTaJBfPa/ANIMSI6gcYZ/UWmZe9Mttt3uUXGsF8=";
    })
    .overrideAttrs (_: {
      GIT_CONFIG_COUNT = 1;
      GIT_CONFIG_KEY_0 = "url.https://github.com/.insteadOf";
      GIT_CONFIG_VALUE_0 = "git@github.com:";
    });

  buildInputs = [zig sqlite];

  buildPhase = ''
    export XDG_CACHE_HOME=$(mktemp -d)
    mkdir $out
    zig build install --prefix $out -Doptimize=ReleaseSafe
    rm -rf $XDG_CACHE_HOME
  '';
  meta = with lib; {
    description = "OkBob is a small reminder app i built for personal use ";
    license = licenses.mit;
    platforms = platforms.all;
    mainProgram = "OkBob";
  };
}
