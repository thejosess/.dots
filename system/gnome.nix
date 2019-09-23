{config, pkgs, ... }:
let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in
{
    services.xserver = {
    desktopManager.gnome3.enable = true;
    displayManager = {
      # extraSessionFilePackages = [ pkgs.sway ];
      gdm = {
        enable = true;
        wayland = true;
        debug = true;
      };
      setupCommands = ''
        xrdb -merge /etc/X11/Xresources
        # xsetroot -xcf ${pkgs.vanilla-dmz}/share/icons/Vanilla-DMZ/cursors/X_cursor 48
        # ${pkgs.networkmanagerapplet}/bin/nm-applet &
        # NIX_SKIP_KEYBASE_CHECKS=1 /run/current-system/sw/bin/keybase-gui &
        # ${pkgs.udiskie}/bin/udiskie --s &
        ${pkgs.gitAndTools.git-annex}/bin/git-annex assistant --autostart &
      '';
    };
  };

  services.packagekit.enable = false;

  services.gnome3 = {
    gnome-documents.enable = false;
    gnome-online-accounts.enable = false;
    gnome-online-miners.enable = false;
    gnome-user-share.enable = false;
  };

  environment.systemPackages = with pkgs; [
    gnome3.dconf
    gnome3.gdm
    gnome3.gnome-desktop
    gnome3.gnome-session
    gnome3.gnome-tweaks
  ];

  environment.gnome3.excludePackages = [
    pkgs.gnome-usage
    pkgs.gnome3.accerciser
    pkgs.gnome3.cheese
    pkgs.gnome3.epiphany
    pkgs.gnome3.evince
    pkgs.gnome3.evolution
    pkgs.gnome3.gedit
    pkgs.gnome3.totem
    pkgs.gnome3.vino
    pkgs.gnome3.simple-scan
    pkgs.gnome3.gnome-packagekit
    pkgs.gnome3.evolution-data-server
    pkgs.gnome3.gnome-documents
    pkgs.gnome3.gnome-calculator
    pkgs.gnome3.gnome-calendar
    pkgs.gnome3.gnome-clocks
    pkgs.gnome3.gnome-contacts
    pkgs.gnome3.gnome-disk-utility
    pkgs.gnome3.gnome-getting-started-docs
    pkgs.gnome3.gnome-maps
    pkgs.gnome3.gnome-weather
    pkgs.gnome3.baobab
    pkgs.gnome3.nautilus-sendto
    pkgs.gnome3.gnome-logs
    pkgs.gnome3.gnome-photos
    pkgs.gnome3.gnome-music
    pkgs.gnome3.gnome-online-accounts
    pkgs.gnome3.gnome-online-miners
    pkgs.gnome3.gnome-power-manager
    pkgs.gnome3.gnome-software
    pkgs.gnome3.gnome-system-monitor
    pkgs.gnome3.gnome-todo
    pkgs.gnome3.gnome-user-docs
    pkgs.gnome3.vinagre
    pkgs.gnome3.yelp
    pkgs.gnome3.yelp-tools
  ];
}
