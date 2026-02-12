{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
  nativeBuildInputs = [
    # Runtime
    (pkgs.ruby.withPackages (ps: [ ps.sinatra ps.rackup ps.puma ps.rubyzip ]))

    # LSP
    pkgs.nil # Nix
  ];
}
