{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "divij";
  home.homeDirectory = "/home/divij";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.

  nixpkgs.config.allowUnfree = true;

  home.packages = [

    # basic utilities
    pkgs.neofetch
    pkgs.ntfs3g
    pkgs.easyeffects 
    pkgs.protonvpn-gui
    pkgs.uv

    # Development softwares
    pkgs.rustup

    # Internet Browser
    pkgs.chromium
    
    # Utilities
    pkgs.digikam
    pkgs.discord
    pkgs.ollama # for fun
    pkgs.kdePackages.okular
    pkgs.tree
    
    # Editors/ide
    #pkgs.zed-editor # doesn't start even after using terminal to manually start
    pkgs.vscode # flatpak implementation
    pkgs.nano
    pkgs.android-studio
    
    # Development Platform/Programming Languages
    pkgs.flutter
    #pkgs.cmake
    #pkgs.glfw
    
    # Note Making
    pkgs.obsidian
    
    # System Monitoring/settings
    pkgs.wezterm # getting frontend error just like warp-terminal
    # pkgs.warp-terminal
    pkgs.btop
    
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

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
  #  /etc/profiles/per-user/divij/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
    GTK_USE_PORTAL=1;
  };
  targets.genericLinux.enable = true;

  # Optional explicitly (but not needed)
  targets.genericLinux.gpu.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
