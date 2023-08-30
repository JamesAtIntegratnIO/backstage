{
  description = "Flake for JavaScript and Python development";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {inherit system;};
        mkdocs-techdocs-core = pkgs.python39Packages.buildPythonPackage {
          pname = "mkdocs-techdocs-core";
          version = "1.2.2";

          src = pkgs.fetchFromGitHub rec {
            owner = "backstage";
            repo = "mkdocs-techdocs-core";
            rev = "cb61e8f49eeeab8fa100e8f5051fa3fbda81043a";
            sha256 = "sha256-5L9xkQfaivq3er0pR0/ztnOYEiqQ0Rq/mfT86rwD8DQ=";
          };
        };
        pythonEnv = pkgs.python310.withPackages (ps:
          with ps; [
            # mkdocs-material
            mkdocs-techdocs-core
          ]);
      in {
        devShell = pkgs.mkShell {
          name = "my-project-env";
          buildInputs = with pkgs; [
            # Python packages
            pythonEnv

            # JavaScript packages
            nodejs_18
            yarn
            graphviz
            plantuml
          ];
        };
      }
    );
}
