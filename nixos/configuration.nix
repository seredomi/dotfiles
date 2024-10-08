# Edit this configuration file to define what should be installed ooon
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:


{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # M2 Max babyyyy
      ./apple-silicon-support
    ];
  hardware = {
    asahi.peripheralFirmwareDirectory = ./firmware;
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "ser-macbook"; # Define your hostname.
  networking.wireless.iwd = {
    enable = true;
    settings.General.EnableNetworkConfiguration = true;
  };


  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    # font = "Lat2-Terminus26";
    useXkbConfig = true; # use xkb.options in tty.
    colors = [
      "f5f5f5"
      "e6e9ef"
      "e3e5e8"
      "eceff1"
      "cfd8dc"
      "171a1c"
      "9e0000"
      "5c3e99"
      "9e0000"
      "d47500"
      "54433a"
      "16524f"
      "16524f"
      "54433a"
      "54433a"
      "9e0000"
    ];
  };

  fonts.packages = with pkgs; [ iosevka ];

  # Enable the X11 windowing system.
  services = {
      xserver = {
          enable = true;
          displayManager.startx.enable = true;
          windowManager.xmonad = {
            enable = true;
            enableContribAndExtras = true;
          };
	  exportConfiguration = true;
      };
      libinput = {
          enable = true;
          # mouse.accelProfile = "flat";
          touchpad = {
	    naturalScrolling = false;
	    disableWhileTyping = true;
	    accelSpeed = "0.7";
	    tapping = false;
	  };


      };
      blueman.enable = true;
      mullvad-vpn.enable = true;
  };
  

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "obsidian"
      "zed-editor"
    ];

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # services.pipewire = {
  #   enable = true;
  #   pulse.enable = true;
  # };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ser = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      # dev stuff 
      gh
      jre
      nodejs
      yarn
      ruby
      rubyPackages_3_3.prettier
      rubyPackages_3_3.rubocop
      tree-sitter
      go
      php
      php83.packages.composer
      cargo
      julia
      lua-language-server
      stylua
      luarocks
      (lua5_1.withPackages (ps: with ps; [ luasnip jsregexp ]))
      (python311.withPackages (ps: with ps; [
	pip
        numpy 
        pandas
	matplotlib
        scikitlearn
        jupyterlab
        tensorflow
	pynvim
	jupyter-client
	ueberzug
	cairosvg
	pnglatex
	plotly
	pyperclip
	selenium
	pick
	tqdm
	python-dateutil
	requests
	gevent
	wget
	ffmpy
      ]))

      # cli stuff
      git
      p7zip
      openssh
      ripgrep
      fd
      eza
      stow
      mullvad-vpn
      unzip
      kalker
      neofetch

      # desktop env type stuff
      xmobar
      dmenu
      kitty
      entr
      scrot
      feh
      find-cursor
      bluetuith
      iosevka

      # big guis
      firefox
      vscodium
      chromium
      obsidian
      zed-editor
      wireshark

    ];
  };

  environment.systemPackages = with pkgs; [
    neovim
    git
    rxvt-unicode
    xsel
    pciutils
    tree
    wget
    gcc
    brightnessctl
    htop
    alsa-utils
    tmux
    gnumake
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

  # Docker !
  virtualisation.docker.enable = true;

  # Open ports in the firewall for dropbox?
  # networking.firewall = {
  #   allowedTCPPorts = [ 17500 ];
  #   allowedUDPPorts = [ 17500 ];
  # };

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11"; # Did you read the comment? yes:)

}

