{ pkgs }:
with pkgs;
[
    neovim
    # mkalias
    tmux
    fzf
    zoxide
    oh-my-posh
    tree
    pdf2svg
    fastfetch

    # Github
    gh

    # fswatch
    # choose-gui
    # Python
    python312
    python312Packages.pip
    uv
    # Nodejs
    nodejs
    nodePackages.eas-cli
    supabase-cli # interact with supabase

    go
    lua
    # file manager
    yazi
    # java
    jdk17
    ruby
    yt-dlp # download youtube videos 

    pandoc
]

