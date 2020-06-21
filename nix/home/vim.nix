{ pkgs, ... }:

{
  programs.vim = {
    enable = true;

    settings = {
      background = "dark";
      backupdir = [ "~/.vim/backup" ];
      directory = [ "~/.vim/swp" ];
      mouse = "a";

      expandtab = true;
      tabstop = 4;

      ignorecase = true;
      smartcase = true;
    };

    extraConfig = ''
      set nocompatible
      set autoread
      set title
      set encoding=utf-8
      set showcmd
      set number
      set cursorline

      set copyindent
      set autoindent
      set smartindent

      syntax enable
    '';

    plugins = with pkgs.vimPlugins; [
      fzf-vim
      vim-airline
    ];
  };
}