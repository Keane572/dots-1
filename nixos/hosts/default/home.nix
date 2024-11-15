{ config, pkgs, inputs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "keane";
  home.homeDirectory = "/home/keane";

  imports = [
    inputs.nixcord.homeManagerModules.nixcord
  ];

  nixpkgs.config.allowUnfree = true;

programs = {
   zsh = {
      enable = true;
      initExtra = "fastfetch -l nix_old_small -s title:separator:os:host:kernel:uptime:packages:shell:de:wm:terminal:cpu:gpu:memory:swap:disk";
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      oh-my-zsh.enable = true;
      enableCompletion = true;
      oh-my-zsh.theme = "agnoster";
     };
   neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      plugins = with pkgs.vimPlugins; [ 
      {
        plugin = gruvbox-nvim;
        config = "colorscheme gruvbox";
      }
      vim-nix
       ];
     };
     nixcord = {
    enable = true;  # enable Nixcord. Also installs discord package
    config = {
      useQuickCss = true;   # use out quickCSS
      themeLinks = [        # or use an online theme
        "https://raw.githubusercontent.com/Synqat/vencord-theme/main/theme.css"
      ];
      plugins = {
        fakeNitro.enable = true;
        USRBG.enable = true;
        alwaysAnimate.enable = true;
        };
      };
    };
  };

  gtk.enable = true;
  gtk.cursorTheme.package = pkgs.bibata-cursors;
  gtk.cursorTheme.name = "Bibata-Modern-Ice";
  gtk.theme.package = pkgs.colloid-gtk-theme;
  gtk.theme.name = "Colloid-Dark";
  gtk.iconTheme.package = pkgs.gruvbox-plus-icons;
  gtk.iconTheme.name = "Gruvbox-Plus-Dark";

  qt.enable = true;
  qt.platformTheme.name = "gtk";
  qt.style.name = "adwaita-dark";
  qt.style.package = pkgs.adwaita-qt;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
     pkgs.nautilus
     pkgs.libsForQt5.ark
     pkgs.swww
     pkgs.waypaper
     pkgs.bottles
     pkgs.heroic
     pkgs.lutris
     pkgs.cpu-x
     pkgs.mangohud
     pkgs.eww
     pkgs.rofi-wayland
     pkgs.networkmanagerapplet
     pkgs.kodi-wayland
     pkgs.waybar
     pkgs.hyprgui
     pkgs.obsidian
     pkgs.tor-browser
     pkgs.komikku
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/keane/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "\${HOME}/.steam/root/compatibilitytools.d";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
