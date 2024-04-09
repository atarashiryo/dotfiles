{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    unzip
    zip
    unrar
    rar
    btop
    neofetch
    nitch
    p7zip
  ];
}
