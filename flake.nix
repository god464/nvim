{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };
  outputs =
    inputs@{ self, flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      perSystem =
        { pkgs, ... }:
        {
          devShells.default = pkgs.mkShell {
            packages = with pkgs; [
              # nix
              nixd
              nixfmt-rfc-style

              # lua
              lua-language-server
              stylua
              selene

              #yaml
              yaml-language-server
              yamlfmt

              #toml
              taplo
            ];
          };
        };
    };
}
