{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    brave
  ];

  programs.firefox.enable = true;
}
