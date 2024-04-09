{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    btop
    neofetch
    nitch
  ];
}
