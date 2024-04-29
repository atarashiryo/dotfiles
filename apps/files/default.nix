{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cinnamon.nemo
    unzip
    zip
    unrar
    rar
    p7zip
    xarchiver
  ];

  services.gvfs.enable = true;
}
