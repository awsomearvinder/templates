{
  description = "A rust flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    alejandra.url = "github:kamadorueda/alejandra";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    alejandra,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {inherit system;};
    in {
      packages.appname = pkgs.rustPlatform.buildRustPackage {
        pname = "app name";
        version = "0.1a";
        src = ./.;
        cargoLock.lockFile = ./Cargo.lock;
      };
      formatter = alejandra.defaultPackage.${system};
      defaultPackage = self.packages.x86_64-linux.appname;
    });
}
