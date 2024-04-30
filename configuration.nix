{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./apps
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader = { 
    efi = {
      canTouchEfiVariables = true;
    };
    grub = { 
      enable = true; 
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
    }; 
  };

  # Enable flakes 
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Set up networking
  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Jakarta";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "id_ID.UTF-8";
    LC_IDENTIFICATION = "id_ID.UTF-8";
    LC_MEASUREMENT = "id_ID.UTF-8";
    LC_MONETARY = "id_ID.UTF-8";
    LC_NAME = "id_ID.UTF-8";
    LC_NUMERIC = "id_ID.UTF-8";
    LC_PAPER = "id_ID.UTF-8";
    LC_TELEPHONE = "id_ID.UTF-8";
    LC_TIME = "id_ID.UTF-8";
  };
  
  # Xserver
  services.xserver = {
    enable = true;
    xkb = { 
      layout = "us"; 
      variant = ""; 
    };
    excludePackages = with pkgs; [
      xterm
    ];
  };

  services.displayManager.sddm = { 
    enable = true; 
    wayland.enable = true;
    theme = "chili";
  };

  services.libinput.enable = true;

  # Enable printing
  services.printing.enable = true;

  # Sound settings
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa = { 
      enable = true; 
      support32Bit = true; 
    };
    pulse.enable = true;
    jack.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.rev = {
    isNormalUser = true;
    description = "Rev";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
  };

  # Enable unfree software
  nixpkgs.config.allowUnfree = true;

  # Fonts!
  fonts.packages = with pkgs; [
     (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = false;

  # Disable an annoying git GUI
  programs.ssh.askPassword = "";

  # Delete generation older than 7 days
  nix.gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 7d";
  };

  
  nix.nixPath = [ 
    "nixos-config=/home/rev/Dotfiles/configuration.nix" 
    "nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos"
    "/nix/var/nix/profiles/per-user/root/channels"
  ];

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
