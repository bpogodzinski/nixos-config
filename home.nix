{ config, pkgs, ... }:

{
  home.username = "panda";
  home.homeDirectory = "/home/panda";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    
    # Utils
    ripgrep
    jq
    eza
    fzf
    dive
    tree
    which
    file
    gnused
    tldr

    # Networking
    wget
    mtr
    openvpn
    nmap
    dnsutils
    nettools

    # Archives
    xz
    zip
    unzip
    zstd

    # Monitoring
    btop
    iotop
    iftop
    strace
    ltrace
    lsof

    # Misc
    gnupg
    vim
    vscode
    google-chrome
    thunderbird
    zotero
    jabref
    discord
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


  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Enable TMUX
  programs.tmux = {
    enable = true;
    shortcut = "a";
    plugins = with pkgs; [
        tmuxPlugins.sensible
        tmuxPlugins.power-theme
       ];
    baseIndex = 1;
    extraConfig = ''
      # split panes using | and -
      bind | split-window -h
      bind - split-window -v
      unbind '"'
      unbind %

      # switch panes using Alt-arrow without prefix
      bind -n M-Left select-pane -L
      bind -n M-Right select-pane -R
      bind -n M-Up select-pane -U
      bind -n M-Down select-pane -D

      # Enable mouse mode
      set -g mouse on
    '';
  };

  # Enable git
  programs.git = {
    enable = true;
    lfs.enable = true;
    userName = "Bartłomiej Pogodziński";
    userEmail = "bartlomiej.pogodzinski@gmail.com";
  };

  catppuccin = {
    flavor = "frappe";
    enable = true;
  };


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
