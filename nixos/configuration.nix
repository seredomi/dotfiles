# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "ser-nix"; # Define your hostname.
  # Pick only one of the below networking options.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  time.timeZone = "Asia/Seoul";


  i18n.defaultLocale = "en_US.UTF-8";

  console = {
    font = "Lat2-Terminus16";
    # keyMap = "us";
    useXkbConfig = true; # use xkbOptions in tty.
  };

  # Enable the X11 windowing system.
  services.xserver = {

	  enable = true;
	  videoDrivers = [ "modesetting" ];
	  displayManager.startx.enable = true;
	  windowManager.xmonad = {
	    enable = true;
	    enableContribAndExtras = true;
	  };
	  libinput = {
	  	enable = true;
		mouse.accelProfile = "flat";
		touchpad.naturalScrolling = true;
	};
  };


  

  # Configure keymap in X11
  # this throws an error if i leave it enabled
  # services.xserver.layout = "us";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # redshift
  location = {
  	provider = "manual";
	latitude = 36.965612;
	longitude = 127.016672;
  };
  services.redshift = {
  	enable = true;
	temperature = {
		day = 6500;
		night = 3200;
	};
};

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # user + user_pkgs
  users.users.ser = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ]; 
    packages = with pkgs; [
      p7zip
      xmobar
      dmenu
      kitty
      emacs
      gh
      vscodium
      jre
      python3
      nodejs
      yarn
      firefox
      chromium
      entr
      zoxide
      ripgrep
      exa
      stow
      scrot
      feh
      redshift
      bluez
      globalprotect-openconnect
    ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim 
    wget
    gcc
    git
    rxvt-unicode
    brightnessctl
    xsel
    pciutils
    tree
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
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment? yes :)

}

