{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = import nixpkgs {
            inherit system;
          };
        in
        with pkgs;
        {
          devShells.default = mkShell {
            buildInputs = [
              (python3.withPackages (ps: with ps; [
                ipykernel
                jupyter
                matplotlib
                numpy
                pandas
                pip
                scikit-learn
              ]))
            ];
          };
        }
      );
}
