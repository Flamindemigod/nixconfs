{
programs.mangohud = {
enable = true;
settingsPerApplication = {
"wine-GenshinImpact.exe" = {
legacy_layout=false;
round_corners=10;
background_alpha=0.2;
background_color=000000;
font_file="/nix/store/60nsvjvqrzpcmw5s2gasm2jpqbal2b9h-fira-code-6.2/share/fonts/truetype/FiraCode-VF.ttf";
font_size=18;
text_color="FFFFFF";
position="top-left";
offset_x=12;
offset_y=712;
toggle_hud="Shift_R+F12";
hud_compact=true;
#pci_dev=0:26:00.0;
table_columns=3;
fps=true;
fps_limit=0;
fps_color_change=true;
fps_color="B22222,FDFD09,39F900";
fps_value="30,60";
fps_limit_method="late";
toggle_fps_limit="Shift_L+F1";
cpu_text="CPU";
cpu_stats=true;
cpu_load_change=true;
cpu_load_value="50,90";
cpu_load_color="FFFFFF,FFAA7F,CC0000";
cpu_temp=true;
cpu_color="2E97CB";
gpu_text="GPU";
gpu_stats=true;
gpu_load_change=true;
gpu_load_value="50,90";
gpu_load_color="FFFFFF,FFAA7F,CC0000";
throttling_status=true;
gpu_core_clock=true;
gpu_mem_clock=true;
gpu_temp=true;
gpu_fan=true;
gpu_color="2E9762";
vram=true;
vram_color="AD64C1";
frame_timing=true;
frametime_color="00FF00";
throttling_status_graph=true;
custom_text_center="I use Nix btw";

#offset=0;
vsync=1;
gl_vsync=0;
 };
};
};
}
