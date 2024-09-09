{ pkgs, inputs, lib, ... }:
let
  laravelPlugin = pkgs.vimUtils.buildVimPlugin {
    name = "laravel";
    src = inputs.plugin-laravel;
  };
in
{
  extraPlugins = [
    laravelPlugin
    pkgs.vimPlugins.nui-nvim
    pkgs.vimPlugins.vim-dotenv
    pkgs.vimPlugins.plenary-nvim
  ];

  extraConfigLua = "require('laravel').setup()";

  plugins = {
    none-ls = {
      enable = true;
      sources = {
        formatting.pint = {
          enable = true;
          package = null;
        };
      };
    };
    # cmp.settings.sources = [ { name = "laravel"; } ];
  };

  keymaps =
    lib.mapAttrsToList
      (key: action: {
        inherit key action;
        mode = "n";
      })
      {
        "<leader>ll" = "<cmd>Laravel<cr>";
        "<c-g>" = "<cmd>Laravel view_finder<cr>";
        "<leader>la" = "<cmd>Laravel art<cr>";
        "<leader>lr" = "<cmd>Laravel routes<cr>";
        "<leader>lh" = "<cmd>Laravel art docs<cr>";
        "<leader>lm" = "<cmd>Laravel make<cr>";
        "<leader>ln" = "<cmd>Laravel related<cr>";
        "<leader>lc" = "<cmd>Laravel commands<cr>";
        "<leader>lo" = "<cmd>Laravel resources<cr>";
      };
}
