{ config, lib, pkgs, ... }:

{
  home-manager.users.rev = { pkgs, ... }: {
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
          "on-click" = "rofi -show drun -disable-history";
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
  };
}
