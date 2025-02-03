{pkgs, ...}: {
  xdg.configFile."MangoHud/wine-ZenlessZoneZero.conf".text = ''
    legacy_layout=false

    background_alpha=0.2
    round_corners=10
    background_alpha=0.2
    background_color=000000
    font_file=${pkgs.fira-code}/share/fonts/truetype/FiraCode-VF.ttf
    font_size=18
    text_color=FFFFFF
    position=top-left
    offset_x=12
    offset_y=712
    toggle_hud=Shift_R+F12
    hud_compact
    table_columns=3
    fps
    fps_limit=0
    fps_color_change
    fps_color=B22222,FDFD09,39F900
    fps_value=30,60
    fps_limit_method=late
    toggle_fps_limit=Shift_L+F1

    cpu_text=CPU
    cpu_stats
    cpu_load_change
    cpu_load_value=50,90
    cpu_load_color=FFFFFF,FFAA7F,CC0000
    cpu_temp
    cpu_color=2E97CB

    gpu_text=GPU
    gpu_stats
    gpu_load_change
    gpu_load_value=50,90
    gpu_load_color=FFFFFF,FFAA7F,CC0000
    throttling_status
    gpu_core_clock
    gpu_mem_clock
    gpu_temp
    gpu_fan
    gpu_color=2E9762

    vram
    vram_color=AD64C1


    frame_timing
    frametime_color=00FF00
    throttling_status_graph
    custom_text_center=I use Nix btw

    #offset=0
    vsync=1
    gl_vsync=0
  '';
  xdg.configFile."MangoHud/wine-StarRail.conf".text = ''
    legacy_layout=false

    background_alpha=0.2
    round_corners=10
    background_alpha=0.2
    background_color=000000
    font_file=${pkgs.fira-code}/share/fonts/truetype/FiraCode-VF.ttf
    font_size=18
    text_color=FFFFFF
    position=top-left
    offset_x=12
    offset_y=712
    toggle_hud=Shift_R+F12
    hud_compact
    table_columns=3
    fps
    fps_limit=0
    fps_color_change
    fps_color=B22222,FDFD09,39F900
    fps_value=30,60
    fps_limit_method=late
    toggle_fps_limit=Shift_L+F1

    cpu_text=CPU
    cpu_stats
    cpu_load_change
    cpu_load_value=50,90
    cpu_load_color=FFFFFF,FFAA7F,CC0000
    cpu_temp
    cpu_color=2E97CB

    gpu_text=GPU
    gpu_stats
    gpu_load_change
    gpu_load_value=50,90
    gpu_load_color=FFFFFF,FFAA7F,CC0000
    throttling_status
    gpu_core_clock
    gpu_mem_clock
    gpu_temp
    gpu_fan
    gpu_color=2E9762

    vram
    vram_color=AD64C1


    frame_timing
    frametime_color=00FF00
    throttling_status_graph
    custom_text_center=I use Nix btw

    #offset=0
    vsync=1
    gl_vsync=0
  '';
  xdg.configFile."MangoHud/wine-witcher3.conf".text = ''
    legacy_layout=false

    background_alpha=0.2
    round_corners=10
    background_alpha=0.2
    background_color=000000
    font_file=${pkgs.fira-code}/share/fonts/truetype/FiraCode-VF.ttf
    font_size=18
    text_color=FFFFFF
    position=top-left
    offset_x=12
    offset_y=712
    toggle_hud=Shift_R+F12
    hud_compact
    table_columns=3
    fps
    fps_limit=0
    fps_color_change
    fps_color=B22222,FDFD09,39F900
    fps_value=30,60
    fps_limit_method=late
    toggle_fps_limit=Shift_L+F1

    cpu_text=CPU
    cpu_stats
    cpu_load_change
    cpu_load_value=50,90
    cpu_load_color=FFFFFF,FFAA7F,CC0000
    cpu_temp
    cpu_color=2E97CB

    gpu_text=GPU
    gpu_stats
    gpu_load_change
    gpu_load_value=50,90
    gpu_load_color=FFFFFF,FFAA7F,CC0000
    throttling_status
    gpu_core_clock
    gpu_mem_clock
    gpu_temp
    gpu_fan
    gpu_color=2E9762

    vram
    vram_color=AD64C1


    frame_timing
    frametime_color=00FF00
    throttling_status_graph
    custom_text_center=I use Nix btw

    #offset=0
    vsync=1
    gl_vsync=0
  '';
}
