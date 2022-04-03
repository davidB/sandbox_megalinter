{ pkgs ? import (builtins.fetchTarball {
  # Descriptive name to make the store path easier to identify
  name = "nixpkgs-21.11-darwin";
  # Commit hash for nixpkgs-unstable as of 2021-05-15 from https://status.nixos.org/
  url = "https://github.com/nixos/nixpkgs/archive/ed02c2ba0384.tar.gz";
  # Hash obtained using `nix-prefetch-url --unpack <url>`
  sha256 = "040rawxqbpblxpsq73qxlk25my2cm0g3gx1pksiacsj15q5fi84q";
}) {}}:

pkgs.mkShell {                  # mkShell is a helper function
  name="dev-environment";       # that requires a name

  nativeBuildInputs = with pkgs; [    # for a list of packages (search https://search.nixos.org/packages)
    cargo
    rustfmt
    clippy
  ]
  ;
  buildInputs = with pkgs; [
    # libiconv
  ]
  # dependencies of the code (on macosx)
  ++ pkgs.lib.optionals pkgs.stdenv.isDarwin [
    pkgs.darwin.apple_sdk.frameworks.Security
  ]
;

  shellHook = '' # bash to run when you enter the shell
  '';
}
