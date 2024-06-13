{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kitty
    btop
    fastfetch
    nitch
    lutgen
    distrobox
  ];

  virtualisation.docker.enable = true;
}
