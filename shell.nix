{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
  nativeBuildInputs = [
    # Runtime
    (pkgs.ruby.withPackages (ps: [ ps.sinatra ps.rackup ps.puma ]))

    # LSP
    pkgs.nil # Nix
  ];
}
