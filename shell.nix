{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
  nativeBuildInputs = [
    # Compiler, Build tools & Runtime (JVM)
    pkgs.jdk25
    pkgs.gradle_9

    # LSP
    pkgs.nil # Nix
    pkgs.jdt-language-server # Java
  ];
}
