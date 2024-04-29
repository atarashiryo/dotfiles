{ config, pkgs, spicetify-nix, ... }:
let
  spicePkgs = spicetify-nix.packages.${pkgs.system}.default;
in
{
  environment.systemPackages = with pkgs; [
    lmms
    kdenlive
    g4music
    python312Packages.deemix
    spotify
  ];
}
