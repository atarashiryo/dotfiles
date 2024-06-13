{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cinnamon.nemo
    unzip
    zip
    p7zip
    xarchiver
  ];

  services.gvfs.enable = true;
}
