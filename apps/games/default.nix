{ config, pkgs, inputs, ... }:

{
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  programs.steam.enable = true; 

  environment.systemPackages = with pkgs; [
    heroic
    osu-lazer-bin
    inputs.pollymc.packages."${pkgs.system}".pollymc
    jdk21_headless
  ];
}
