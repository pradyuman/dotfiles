{ stdenv, pkgs, ...}:

stdenv.mkDerivation rec {
  version = "4.1.0";
  name = "n-${version}";

  src = pkgs.fetchFromGitHub {
    owner = "tj";
    repo = "n";
    rev = "v${version}";
    sha256 = "1sqyvv0dzskggsg99kignxwl46a6cz2w6is50k2hsq773805i8dd";
  };

  makeFlags = [ "PREFIX=$(out)" ];
}