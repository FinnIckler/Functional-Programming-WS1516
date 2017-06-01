with import <nixpkgs> {};
#{pkgs, stdenv, buildEnv, ...}:

stdenv.mkDerivation {
  name = "FP-script";

  src = ./.;
  
  buildInputs = with pkgs; [
    texlive.combined.scheme-full
    python35Packages.pygments
    bash
  ];

  buildPhase = ''
    xelatex -shell-escape Mitschrieb.tex
  '';

  installPhase = ''
    cp Mitschrieb.pdf $out/
  '';
}
