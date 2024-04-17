{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    unzip
    zip
    unrar
    rar
    p7zip
    xarchiver
  ];

  services.gvfs.enable = true;

  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [ thunar-archive-plugin thunar-volman ];
  };
}
