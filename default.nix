with import <nixpkgs> {};
#{pkgs, stdenv, buildEnv, ...}:

let
  hs = pkgs.fetchurl {
    url = "https://ipfs.io/ipfs/QmRov5YDoer4dd75haUaVRRxgQh6y2h3QzRuEDvfnZUn3R/hs.tar.gz";
    sha256 = "00acb13zgffy5mrq5cmwm7k8vqjm4678f8gxzm96mvmy0229iwcb";
  };
in
stdenv.mkDerivation {
  name = "FP-script";

  src = ./.;
  
  buildInputs = with pkgs; [
    texlive.combined.scheme-full
    python35Packages.pygments
    which
  ];

  buildPhase = ''
    tar -xf ${hs}
    xelatex -shell-escape Mitschrieb.tex
  '';

  installPhase = ''
    mkdir -p $out
    cp Mitschrieb.pdf $out/
  '';
}
