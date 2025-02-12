{
    enable = true;
    settings = {
        vim = {
            theme = {
                enable = true;
                name = "catppuccin";
                style = "mocha";
            };
          
          filetree.nvimTree.setupOpts.view.relativenumber = true;
          
          statusline.lualine.enable = true;
          statusline.lualine.theme = "catppuccin";
          telescope.enable = true;
          autocomplete.nvim-cmp.enable = true;

          languages = {
            enableLSP = true;
            enableTreesitter = true;

            nix.enable = true;
            ts.enable = true;
          };
          
          options = {
            shiftwidth = 4;
            tabstop = 4;
            autoindent = false;
          };
        };
      };

}
