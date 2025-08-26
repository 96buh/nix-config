{ pkgs, config, ... }:

{
    enable = true;
    userName = "Homer";
    userEmail = "j29823678@gmail.com";
    extraConfig = {
        core.editor = "nvim";
    };
}
