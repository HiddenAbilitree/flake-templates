{
  description = "A bun template";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    systems.url = "systems";
  };

  outputs = {
    systems,
    nixpkgs,
    ...
  }: let
    eachSystem = f: nixpkgs.lib.genAttrs (import systems) (system: f nixpkgs.legacyPackages.${system});
  in {
    devShells = eachSystem (pkgs: {
      default = pkgs.mkShell {
        buildInputs = with pkgs; [
          nodejs_23
          bun

          nodePackages.typescript
          nodePackages.typescript-language-server
        ];
      };
    });
  };
}
