{pkgs, ...}: {
programs.tmux = {
enable = true;
mouse = true;
disableConfirmationPrompt = true;
keyMode = "vi";
newSession=true;
sensibleOnTop = true;
shell = "${pkgs.zsh}/bin/zsh";
terminal = "st-256color";
plugins = with pkgs; [
  {
  plugin = tmuxPlugins.rose-pine;
extraConfig = ''
	set -g @rose_pine_variant 'main'
	set -g @rose_pine_date_time "%a %d/%m/%C"
	set -g @rose_pine_directory "on"	
	set -g @rose_pine_user "off"
	set -g @rose_pine_disable_active_window_menu 'on'
	set -g @rose_pine_left_separator '  ' 
	set -g @rose_pine_right_separator '  ' 
	set -g @rose_pine_field_separator '󰇝' 
	set -g @rose_pine_window_separator '󰇝'
	set -g @rose_pine_session_icon '' 
	set -g @rose_pine_current_window_icon '' 
	set -g @rose_pine_folder_icon '󰉋' 
	set -g @rose_pine_username_icon '' 
	set -g @rose_pine_window_status_separator "  "
	set -g @rose_pine_prioritize_windows 'off' 
	set -g @rose_pine_width_to_hide '80' 
	set -g @rose_pine_window_count '5' 
	set -g @rose_pine_status_left_prepend_section '󰣇'
'';
  }
  {
    plugin = tmuxPlugins.resurrect;
    extraConfig = ''
	set -g @resurrect-strategy-nvim 'session'
	set -g @resurrect-save 'S'
	set -g @resurrect-resore 'V'
	'';
  }
  {
    plugin = tmuxPlugins.continuum;
    extraConfig = ''
      set -g @continuum-restore 'on'
      set -g @continuum-save-interval '15' # minutes
    '';
  }
];
};
}
