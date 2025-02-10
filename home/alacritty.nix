{ config, pkgs, lib, ... }:

{
  enable = true;

  settings = {
    font = {
      size = 24;
    };

    window = {
      padding = {
        x = 10;
	y = 10;
      };
      decorations = "Buttonless";
    };
  };

  env = {
    TERM = "xterm-256color";
  };
}
