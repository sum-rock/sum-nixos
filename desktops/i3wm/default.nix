{ config, pkgs, callPackage, ... }:
{

  environment.pathsToLink = [ "/libexec" ];

  services.xserver = {
    enable = true;

    desktopManager.xterm.enable = false;

    displayManager = {
      defaultSession = "none+i3";
      lightdm = {
        enable = true;
      };
    };

    windowManager = {
      i3.enable = true;
      i3.package = pkgs.i3-gaps;
      i3.extraPackages = with pkgs; [
        i3lock-fancy
        i3-gaps
        polybar
        rofi
        feh   # For wallpaper
      ];
    };
  };

  home-manager.users.august = {
    xdg.configFile."i3/config".source = ./dotfiles/i3/config;
    xdg.configFile."polybar/config.ini".source = ./dotfiles/polybar/config.ini;
    xdg.configFile."rofi/themes/custom.rasi".source = ./dotfiles/rofi/custom.rasi;
    xdg.configFile."wallpaper/space-station.jpg".source = ./dotfiles/wallpaper/space-station.jpg;

    programs.rofi = {
      enable = true;
      font = "Iosevka 12";
      theme = "custom";
      plugins = [
        pkgs.rofi-emoji
        pkgs.rofi-calc
        pkgs.rofi-power-menu
      ];
      extraConfig = {
        modi = "drun,filebrowser,window";
        dpi = 180;
        show-icons = true;
        sort = true;
        matching = "fuzzy";
      };
    }; 

  };
}
