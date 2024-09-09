{ inputs, ... }:
let
  # additions = {};
    # final: _prev:
    # import ../pkgs {
    #   inherit inputs;
    #   pkgs = final;
    # };

  modifications = final: prev: {
    phpactor-laravel = prev.php.buildComposerProject (finalAttrs: {
      pname = "phpactor";
      version = "master";
      src = inputs.phpactor-laravel;
      vendorHash = "sha256-PjtXBbihPW4n6wa/4RY85fNQAupzVlWykNrp31or0g4=";
    });
  };
in
inputs.nixpkgs.lib.composeManyExtensions [
  # additions
  modifications
]
