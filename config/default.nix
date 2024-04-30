{ config, pkgs, ... }:

{
   imports = [ 
    ./dunst 
    ./hypr
    ./kitty
    ./rofi
    ./themes
    ./waybar
   ];

   home = {
     username = "rev";
     homeDirectory = "/home/rev";
     stateVersion = "23.11";
   };
}
