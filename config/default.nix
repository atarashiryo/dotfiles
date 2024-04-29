{ config, pkgs, ... }:

{
   imports = [ ./dunst ];

   home = {
     username = "rev";
     homeDirectory = "/home/rev";
     stateVersion = "23.11";
   };
   
   wayland.windowManager.hyprland = {
     enable = true;
     extraConfig = '' 
       # Set monitors
       monitor=eDP-1, 1366x768@60, 0x0, 1
       
       # Autostart apps
       exec-once = waypaper --random --restore --backend swaybg
       exec-once = waybar
       exec-once = wl-paste --watch cliphist store
       exec-once = dunst
       exec-once = /usr/lib/polkit-kde-authentication-agent-1
       
       # Some default env vars.
       env = XCURSOR_SIZE,24
       env = QT_QPA_PLATFORMTHEME,qt5ct
       
       input {
           kb_layout = us
           kb_variant =
           kb_model =
           kb_options =
           kb_rules =
       
           follow_mouse = 0
       
           touchpad {
               natural_scroll = true
           }
       
           sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
       }
       
       general {
           gaps_in = 10
           gaps_out = 10
           border_size = 2
           col.active_border = rgba(89b4faee)
           col.inactive_border = rgba(11111bee)
       
           layout = dwindle
       }
       
       decoration {
           rounding = 8
       
           blur {
               enabled = true
               size = 12
               passes = 4
               xray = true
               new_optimizations = on
               ignore_opacity = true
           }
  
           active_opacity = 0.8
           inactive_opacity = 0.6
       
           drop_shadow = true
           shadow_range = 30
           shadow_render_power = 3
           col.shadow = rgba(11111bee)
       }
       
       animations {
           enabled = yes
       
           # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
           bezier = myBezier, 0.10, 0.9, 0.1, 1.05
       
           animation = windows, 1, 7, myBezier, popin
           animation = windowsOut, 1, 7, myBezier, popin
           animation = border, 1, 10, default
           animation = fade, 1, 7, default
           animation = workspaces, 1, 5, default, slide
       }
       
       dwindle {
           pseudotile = true # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
           preserve_split = true # you probably want this
       }
       
       master {
           new_is_master = true
       }
       
       gestures {
           workspace_swipe = true
       }
       
       # Example windowrule v1
       windowrule = float, ^(waypaper)$
       # Example windowrule v2
       # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
       
       misc {
            disable_hyprland_logo = true
       }
       
       # Set mainMod
       $mainMod = SUPER
       
       # Binds
       bind = $mainMod, RETURN, exec, kitty
       bind = $mainMod, Q, killactive,
       bind = $mainMod CTRL, Q, exit,
       bind = $mainMod, V, togglefloating,
       bind = $mainMod, A, exec, rofi -show drun
       bind = $mainMod, W, exec, waypaper
       bind = $mainMod, B, exec, firefox
       bind = $mainMod, J, togglesplit, # dwindle
       bind = $mainMod, Print, exec, grim
       
       # Move focus
       bind = $mainMod, h, movefocus, l 
       bind = $mainMod, l, movefocus, r
       bind = $mainMod, k, movefocus, u
       bind = $mainMod, j, movefocus, d
       
       # Move
       bind = $mainModSHIFT, h, movewindow, l
       bind = $mainModSHIFT, l, movewindow, r
       bind = $mainModSHIFT, k, movewindow, u
       bind = $mainModSHIFT, j, movewindow, d
       
       # Resize
       binde = $mainModCTRL, h, resizeactive, -10 0
       binde = $mainModCTRL, l, resizeactive, 10 0
       binde = $mainModCTRL, k, resizeactive, 0 -10
       binde = $mainModCTRL, j, resizeactive, 0 10
       
       # Switch workspaces
       bind = $mainMod, 1, workspace, 1
       bind = $mainMod, 2, workspace, 2
       bind = $mainMod, 3, workspace, 3
       bind = $mainMod, 4, workspace, 4
       bind = $mainMod, 5, workspace, 5
       bind = $mainMod, 6, workspace, 6
       bind = $mainMod, 7, workspace, 7
       bind = $mainMod, 8, workspace, 8
       bind = $mainMod, 9, workspace, 9
       bind = $mainMod, 0, workspace, 10
       
       
       # Move active window to a workspace
       bind = $mainMod SHIFT, 1, movetoworkspace, 1
       bind = $mainMod SHIFT, 2, movetoworkspace, 2
       bind = $mainMod SHIFT, 3, movetoworkspace, 3
       bind = $mainMod SHIFT, 4, movetoworkspace, 4
       bind = $mainMod SHIFT, 5, movetoworkspace, 5
       bind = $mainMod SHIFT, 6, movetoworkspace, 6
       bind = $mainMod SHIFT, 7, movetoworkspace, 7
       bind = $mainMod SHIFT, 8, movetoworkspace, 8
       bind = $mainMod SHIFT, 9, movetoworkspace, 9
       bind = $mainMod SHIFT, 0, movetoworkspace, 10
       
       # Scroll through existing workspaces
       bind = $mainMod, mouse_down, workspace, e+1
       bind = $mainMod, mouse_up, workspace, e-1
       
       # Move/resize windows
       bindm = $mainMod, mouse:272, movewindow
       bindm = $mainMod, mouse:273, resizewindow
       
       # Control brightnes
       bind= ,XF86MonBrightnessDown ,exec, brightnessctl set 5%-
       bind= ,XF86MonBrightnessUp ,exec, brightnessctl set +5%
     '';
   };
   programs.kitty = {
     enable = true;
     extraConfig = '' 
       # Fonts
       font_family      FiraCode Nerd Font
       
       # The basic colors
       foreground              #CDD6F4
       background              #1E1E2E
       selection_foreground    #1E1E2E
       selection_background    #F5E0DC
       
       # Cursor colors
       cursor                  #F5E0DC
       cursor_text_color       #1E1E2E
       
       # URL underline color when hovering with mouse
       url_color               #F5E0DC
       
       # Kitty window border colors
       active_border_color     #B4BEFE
       inactive_border_color   #6C7086
       bell_border_color       #F9E2AF
       
       # OS Window titlebar colors
       wayland_titlebar_color  #1E1E2E
       macos_titlebar_color    #1E1E2E
       
       # Tab bar colors
       active_tab_foreground   #11111B
       active_tab_background   #CBA6F7
       inactive_tab_foreground #CDD6F4
       inactive_tab_background #181825
       tab_bar_background      #11111B
       
       # Colors for marks (marked text in the terminal)
       mark1_foreground #1E1E2E
       mark1_background #B4BEFE
       mark2_foreground #1E1E2E
       mark2_background #CBA6F7
       mark3_foreground #1E1E2E
       mark3_background #74C7EC
       
       # The 16 terminal colors
       
       # black
       color0 #45475A
       color8 #585B70
       
       # red
       color1 #F38BA8
       color9 #F38BA8
       
       # green
       color2  #A6E3A1
       color10 #A6E3A1
       
       # yellow
       color3  #F9E2AF
       color11 #F9E2AF
       
       # blue
       color4  #89B4FA
       color12 #89B4FA
       
       # magenta
       color5  #F5C2E7
       color13 #F5C2E7
       
       # cyan
       color6  #94E2D5
       color14 #94E2D5
       
       # white
       color7  #BAC2DE
       color15 #A6ADC8
  
       # Padding
       window_padding_width 8
     '';
   };
   programs.waybar = {
     enable = true;
     settings = [{
       "layer" = "bottom";
       "position" = "bottom";
       "height" = 34;
       "margin-bottom" = 8;
       "margin-left" = 10;
       "margin-right" = 10;
       "modules-left" = ["custom/rofi" "hyprland/workspaces"];
       "modules-center" = [];
       "modules-right" = ["battery" "pulseaudio" "clock"];
       "custom/rofi" = {
         "format" = "";
         "on-click" = "rofi -show drun";
       };
       "hyprland/workspaces" = {
         "on-click" = "activate";
         "format" = "{icon}";
         "all-outputs" = "false";
         "on-scroll-up" = "hyprctl dispatch workspace e+1";
         "on-scroll-down" = "hyprctl dispatch workspace e-1";
         "format-icons" = {
           "urgent" = "";
           "default" = "";
         };
         "persistent_workspaces" = {
           "*" = 6;
         };
       };
       "battery" = {
           "format" = "󰁹 {capacity}%";
           "format-charging" = "󰂄 {capacity}%";
       };
       "pulseaudio" = {
           "format" = "󰕾 {volume}%";
           "format-muted" = "󰝟 {volume}%";
           "on-click" = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
           "on-click-right" = "pavucontrol";
           "scroll-step" = 2;
       };
       "clock" = {
           "format-alt" = "{:%a; %d. %b  %H:%M}";
       };
     }];
     style = ''
       * {
           border: none;
           font-family: FiraCode Nerd Font;
           font-size: 14px;
       }
       
       window#waybar {
           background: #11111b;
           border-radius: 8px;
       }
       
       #custom-rofi {
           color: #11111b;
           background: #89b4fa;
           margin: 4px;
           padding-left: 8px;
           padding-right: 14px;
           border-radius: 8px;
           font-size: 15px;
       }
       
       #workspaces {
           background: #1e1e2e;
           margin: 4px;
           padding-left: 4px;
           padding-right: 8px;
           border-radius: 8px;
       }
       
       #workspaces button {
           background: transparent;
           color: #a6adc8;
           padding: 0 4px;
       }
       
       #workspaces button.active {
           background: transparent;
           color: #89b4fa;
       }
       
       #battery {
           color: #11111b;
           background: #89b4fa;
           margin: 4px;
           padding-left: 10px;
           padding-right: 8px;
           border-radius: 8px;
       }
       
       #pulseaudio {
           color: #11111b;
           background: #89b4fa;
           margin: 4px;
           padding-left: 10px;
           padding-right: 8px;
           border-radius: 8px;
       }
       
       #clock {
           color: #11111b;
           background: #89b4fa;
           margin: 4px;
           padding-left: 10px;
           padding-right: 8px;
           border-radius: 8px;
       }
     '';
   };
}
