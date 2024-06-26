{ config, lib, pkgs, ... }:

{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        font = "FiraCode Nerd Font 8";
        corner_radius = 8;
        frame_color = "#89B4FA";
        separator_color = "frame";
      };
      
      urgency_low = {
        background = "#1E1E2E";
        foreground = "#CDD6F4";
      };
      
      urgency_normal = {
        background = "#1E1E2E";
        foreground = "#CDD6F4";
      };
      
      urgency_critical = {
        background = "#1E1E2E";
        foreground = "#CDD6F4";
        frame_color = "#FAB387";
      };
    };                                
  };
}
