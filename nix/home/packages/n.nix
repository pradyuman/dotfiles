{ stdenv, pkgs, ...}:

stdenv.mkDerivation rec {
  pname = "n";
  version = "4.1.0";

  src = pkgs.fetchFromGitHub {
    owner = "tj";
    repo = pname;
    rev = "v${version}";
    sha256 = "1sqyvv0dzskggsg99kignxwl46a6cz2w6is50k2hsq773805i8dd";
  };

  makeFlags = [ "PREFIX=$(out)" ];
}