{
  environment = {
    variables = {
      EDITOR = "nvim";
      RANGER_LOAD_DEFAULT_RC = "FALSE";
      QT_QPA_PLATFORMTHEME = "qt5ct";
      GSETTINGS_BACKEND = "keyfile";
    };
    sessionVariables = rec {
      XDG_CACHE_HOME = "$HOME/.cache";
      XDG_CONFIG_HOME = "$HOME/.config";
      XDG_DATA_HOME = "$HOME/.local/share";
      XDG_STATE_HOME = "$HOME/.local/state";
    };
  };
}
