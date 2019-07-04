{ stdenv, pkgs, ...}:

stdenv.mkDerivation rec {
  version = "1.11";
  name = "z-${version}";

  src = pkgs.fetchFromGitHub {
    owner = "rupa";
    repo = "z";
    rev = "v${version}";
    sha256 = "13zbgkj6y0qhvn5jpkrqbd4jjxjr789k228iwma5hjfh1nx7ghyb";
  };

  dontBuild = true;

  installPhase = ''
    echo $out
    mkdir $out
    cp -r * $out
    ln -sf "$out/z.sh" /usr/local/etc/profile.d/z.sh
  '';
}