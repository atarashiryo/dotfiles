{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    unzip
    zip
    btop
    neofetch
  ];
}
