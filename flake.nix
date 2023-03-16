{
  description = "Flake for JavaScript and Python development";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }: 
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        
      in {
        devShell = pkgs.mkShell {
          name = "my-project-env";
          buildInputs = with pkgs; [
            # Python packages
            python39            

            # JavaScript packages
            nodejs-16_x
            yarn
          ];
        };
      }
    );
}
