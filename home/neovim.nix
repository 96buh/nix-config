{ pkgs, config, ...}

{
    enable = true;

    plugins = with pkgs.vimPlugins; [
        nvim-tree-lua
	nvim-web-devicons
    ];
}
