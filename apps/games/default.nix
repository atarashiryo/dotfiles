{ config, pkgs, ... }:

{
  programs.steam.enable = true; 

  environment.systemPackages = with pkgs; [
    heroic
    osu-lazer-bin
  ];
}
