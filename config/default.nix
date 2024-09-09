{
  imports = [
    ./lsp.nix
    ./telescope.nix

    ./php.nix
    ./laravel.nix
    ./blade.nix

    ./modules/ui
  ];

  config = {
    globals.mapleader = " ";
    opts = {
      number = true;
      relativenumber = true;
    };
  };
}
