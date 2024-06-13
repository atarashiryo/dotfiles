{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    kdePackages.qt6ct
    kdePackages.qt6gtk2
  ];

  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Standard-Blue-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "blue" ];
        size = "standard";
        tweaks = [ "rimless"];
        variant = "mocha";
      };
    };
    iconTheme = { 
      name = "Papirus-Dark"; 
      package = pkgs.catppuccin-papirus-folders;
    };
    font.name = "Inter Medium";
  };

  qt = {
    enable = true;
    platformTheme.name = "qt6ct";
  };
}
