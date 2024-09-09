{pkgs, inputs, ...}: let
  bladeGrammar = pkgs.tree-sitter.buildGrammar {
    language = "blade";
    version = "0.9.2";
    src = inputs.blade-treesitter;
  };
in{
  plugins = {
    treesitter = {
      languageRegister.blade = "blade";
      grammarPackages = [ bladeGrammar ];
    };

    none-ls.sources.formatting.blade_formatter = {
      enable = true;
      package = pkgs.blade-formatter;
    };

    lsp.servers.emmet-ls = {
      enable = true;
      filetypes = [ "blade" ];
    };
  };

  filetype.pattern.".*%.blade%.php" = "blade";

  extraFiles = {
    "queries/blade/highlights.scm".source = ./queries/blade_highlights.scm;
    "queries/blade/injections.scm".source = ./queries/blade_injections.scm;
    "after/queries/html/injections.scm".source = ./queries/html_injection.scm;
  };
}
