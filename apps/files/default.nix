{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nemo
    unzip
    zip
    unrar
    rar
    p7zip
  ];

  services.gvfs.enable = true;
}
