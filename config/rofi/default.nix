{ config, lib, pkgs, ... }:

{
   programs.rofi = {
     enable = true;
     package = pkgs.rofi-wayland

     extraConfig = {
       display-drun = " ";
       drun-display-format = "{name}";
       font = "FiraCode Nerd Font 10";
       show-icons = true;
     };

     theme = mkForce {
      "@theme" = "/dev/null"

      "*" {
        border = mkLiteral "0";
        margin = mkLiteral "0";
        padding = mkLiteral "0";
        spacing = mkLiteral "0";
      };
      
      window {
        width = mkLiteral "30%";
        background-color = mkLiteral "#11111b";
        border = mkLiteral "2";
        border-radius = mkLiteral "12px";
        border-color = mkLiteral "#89b4fa";
      };
      
      element {
        padding = mkLiteral "8 12";
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "#cdd6f4";
      };
      
      element selected {
        text-color = mkLiteral "#11111b";
        background-color = mkLiteral "#89b4fa";
      };
      
      element-text {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "inherit";
        vertical-align = mkLiteral "0.5";
      };
      
      element-icon {
        size = mkLiteral "20";
        padding = mkLiteral "0 10 0 0";
        background-color = mkLiteral "transparent";
      };
      
      entry {
        padding = mkLiteral "12";
        background-color = mkLiteral "#1e1e2e";
        text-color = mkLiteral "#cdd6f4";
      };
      
      inputbar {
        children = mkLiteral  [ "prompt", "entry" ];
        background-color = mkLiteral "#11111b";
      };
      
      listview {
        background-color = mkLiteral "#11111b";
        columns = "1";
        lines = "10";
      };
      
      mainbox {
        children = map mkLiteral [ "inputbar", "listview" ];
        background-color = "#11111b";
      };
      
      prompt {
        enabled = true;
        padding = mkLiteral "12 0 0 12";
        background-color = mkLiteral "#1e1e2e";
        text-color = mkLiteral "#cdd6f4";
      };
     };
   };
}

