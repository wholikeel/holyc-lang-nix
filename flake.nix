{
  description = "HolyC compiler";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/24.05";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = {nixpkgs, ...} @ inputs:
    inputs.utils.lib.eachDefaultSystem
    (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      packages.default = pkgs.callPackage ./default.nix {};
    });
}
