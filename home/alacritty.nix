{ config, pkgs, ... }:

{
  enable = true;

  settings = {
    font = {
      size = 20;

      normal.family = "JetBrainsMono Nerd Font";
    };

    window = {
      padding = {
        x = 10;
	    y = 10;
      };

      decorations = "Buttonless";
      option_as_alt = "Both";
    };
    
    general = {
      import = [ pkgs.alacritty-theme.gruvbox_dark ];
      live_config_reload = true;
    };

    env = {
      TERM = "xterm-256color";
    };

  };

}
