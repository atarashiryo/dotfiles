{ config, pkgs, ... }:

{
  imports = [
    ./browser
    ./wm
    ./coding
    ./commands
    ./games
    ./terminal
    ./office
    ./music
  ];
}
