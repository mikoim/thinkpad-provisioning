# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  nixpkgs.config.allowUnfree = true;

  boot.cleanTmpDir = true;
  boot.kernelPackages = pkgs.linuxPackages_4_13;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.enable = true;
  boot.tmpOnTmpfs = true;

  networking.firewall.enable = false;
  networking.hostName = "chitose";
  networking.wireless.enable = true;

  virtualisation.docker.enable = true;

  time.timeZone = "Asia/Tokyo";

  i18n = {
    consoleFont = "sun12x22";
    consoleKeyMap = "jp106";
    defaultLocale = "en_US.UTF-8";
    inputMethod = {
      enabled = "fcitx";
      fcitx.engines = with pkgs; [ fcitx-engines.mozc ];
    };
  };

  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fontconfig = {
      allowBitmaps = true;
      hinting.enable = false;
    };
    fonts = with pkgs; [
      fira-code
      inconsolata
      ipaexfont
      noto-fonts-cjk
      source-code-pro
      ubuntu_font_family
      unifont
    ];
  };

  environment = {
    enableDebugInfo = true;
    systemPackages = with pkgs; [
      acpi
      anki
      arandr
      arandr
      aria
      chromium
      curl
      discord
      dmidecode
      elementary-icon-theme
      evince
      exa
      exfat
      file
      firefox
      gcc
      gdb
      gimp
      git
      gnome3.dconf
      gnome3.seahorse
      gnumake
      gnupg
      htop
      httpie
      jq
      keepassx-community
      mosh
      mplayer
      mupdf
      mysql-workbench
      neofetch
      neovim
      nox
      ntfs3g
      openvpn
      p7zip
      pavucontrol
      pciutils
      pcmanfm
      peco
      rofi
      scrot
      silver-searcher
      sqlite
      teensy-loader-cli
      terminator
      thunderbird
      tig
      tmux
      unar
      unrar
      unzip
      vim
      vlc
      vlc
      vscode
      w3m
      wget
      wget
      which
      whois
      xclip
      xfontsel
    ];

    variables = {
      GDK_DPI_SCALE = "-1";  # GDK 3 (GTK+ 3)
      GDK_SCALE = "2";  # GDK 3 (GTK+ 3)
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";  # > Qt 5.6
      QT_DEVICE_PIXEL_RATIO = "2";
      XCURSOR_SIZE = "48";
    };
  };

  hardware.cpu.intel.updateMicrocode = true;
  hardware.enableAllFirmware = true;
  hardware.pulseaudio.enable = true;
  hardware.trackpoint = {
    enable = true;
    emulateWheel = true;
    speed = 250;
    sensitivity = 140;
  };

  programs.bash.enableCompletion = true;
  programs.fish.enable = true;
  programs.gnupg.agent = { enable = true; enableSSHSupport = true; };
  programs.light.enable = true;
  programs.mtr.enable = true;
  programs.thefuck.enable = true;
  programs.tmux.enable = true;
  programs.wireshark.enable = true;

  services.compton.enable = true;
  services.fstrim.enable = true;
  services.gnome3.gnome-keyring.enable = true;
  services.locate.enable = true; 
  services.openssh.enable = true;
  services.openssh.forwardX11 = true;
  services.timesyncd.servers = [
    "ntp.nict.jp"
    "ntp1.jst.mfeed.ad.jp"
    "ntp2.jst.mfeed.ad.jp"
    "ntp3.jst.mfeed.ad.jp"
  ];
  services.xserver.desktopManager.xterm.enable = false;
  services.xserver.dpi = 140;
  services.xserver.enable = true;
  services.xserver.layout = "jp";
  services.xserver.libinput.enable = true;
  services.xserver.windowManager.default = "i3";
  services.xserver.windowManager.i3.enable = true;
  services.xserver.displayManager.lightdm = {
    enable = true;
    greeters.gtk.extraConfig = ''
      xft-antialias=true
      xft-dpi=140
      xft-hintstyle=hintsfull
      xft-rgba=rgb
    '';
  };

  users.extraUsers.ek = {
    isNormalUser = true;
    uid = 1000;
    shell = pkgs.fish;
    extraGroups = [ "wheel" ];
  };

  nix.gc.automatic = true;
  nix.gc.dates = "weekly";
  nix.gc.options = "--delete-older-than 30d";
  nix.useSandbox = true;

  system.stateVersion = "18.03";
  system.autoUpgrade.enable = true;
}
