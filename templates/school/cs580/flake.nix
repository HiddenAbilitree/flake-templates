{
  description = "cs580 flake template";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    systems.url = "github:nix-systems/default";
  };

  outputs = {
    systems,
    nixpkgs,
    ...
  }: let
    eachSystem = f: nixpkgs.lib.genAttrs (import systems) (system: f nixpkgs.legacyPackages.${system});
  in {
    devShells = eachSystem (pkgs: {
      default = let
        pythonPackages = pkgs.python3Packages;
        pyamaze = let
          pname = "pyamaze";
          version = "1.0.1";
        in
          pythonPackages.buildPythonPackage {
            inherit pname version;
            src = pkgs.fetchPypi {
              inherit pname version;
              sha256 = "sha256-t0SuUkEVmfFkdV2t4SUs3TGbSTIl3Pew91XZYaVwQ98=";
            };
            doCheck = false;
          };
      in
        pkgs.mkShell {
          buildInputs = with pythonPackages; [
            python
            # pyamaze
            tkinter
            pylint
            mypy
          ];
        };
    });
  };
}
