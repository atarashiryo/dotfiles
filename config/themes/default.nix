{ config, lib, pkgs, ... }:

{
  home-manager.users.rev = { pkgs, ... }: {
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
    };
  };
}
