with import <nixpkgs> {};
#{pkgs, stdenv, buildEnv, ...}:

stdenv.mkDerivation {
  name = "FP-script";

  src = ./.;
  
  buildInputs = with pkgs; [
    texlive.combined.scheme-full
    python35Packages.pygments
    which
  ];

  buildPhase = ''
    xelatex -shell-escape Mitschrieb.tex
  '';

  installPhase = ''
    mkdir -p $out
    cp Mitschrieb.pdf $out/
  '';
}
