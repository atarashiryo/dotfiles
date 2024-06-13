{ config, pkgs, spicetify-nix, ... }:

{
  environment.systemPackages = with pkgs; [
    lmms
    shotcut
    g4music
    python312Packages.deemix
    handbrake
  ];
}
