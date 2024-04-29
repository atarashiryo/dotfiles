{ config, pkgs, ... }:

{
  imports = [
    ./browser
    ./wm
    ./coding
    ./games
    ./terminal
    ./office
    ./multimedia
    ./files
  ];
}
