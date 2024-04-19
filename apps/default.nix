{ config, pkgs, ... }:

{
  imports = [
    ./browser
    ./wm
    ./coding
    ./games
    ./terminal
    ./office
    ./music
    ./files
  ];
}
