# shell.nix
# author: D.A.Pelasgus

# Rust User Shell
let
  # Unstable Channel | Rolling Release
  pkgs = import (fetchTarball("channel:nixpkgs-unstable")) { };
  packages = with pkgs; [
    pkg-config
    rustc
    cargo
    rustfmt
    rust-analyzer
    trunk
    openssl
  ];
  OPENSSL_DIR = "${pkgs.openssl.dev}";
  PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
in
pkgs.mkShell {
  buildInputs = packages;
}
