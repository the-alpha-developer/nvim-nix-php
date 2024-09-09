{ pkgs, ... }:
{
  extraPackages = [
    pkgs.php83
    pkgs.php83Packages.composer
  ];

  plugins = {
    lsp = {
      servers.phpactor = {
        enable = true;
        package = pkgs.phpactor-laravel;
      };
    };
    treesitter = {
      enable = true;
      settings = {
        indent.enable = true;
        highlight.enable = true;
      };
      grammarPackages = pkgs.vimPlugins.nvim-treesitter.passthru.allGrammars;
    };
    treesitter-context.enable = true;
    treesitter-textobjects = {
      enable = true;
      select = {
        enable = true;
        keymaps = {
          "af" = "@function.outer";
          "if" = "@function.inner";
        };
      };
    };
  };
}
