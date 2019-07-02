{ stdenv, pkgs, ...}:

stdenv.mkDerivation rec {
  version = "0.0.1";
  name = "pure-prompt-${version}";
  src = pkgs.fetchFromGitHub {
    owner = "sindresorhus";
    repo = "pure";
    rev = "v1.10.3";
    sha256 = "0zjgnlw01ri0brx108n6miw4y0cxd6al1bh28m8v8ygshm94p1zx";
  };

  unpackCmd = ''
    unzip $curSrc
  '';

  installPhase = ''
    mkdir $out
    cp -r * $out
    ln -s "$out/pure.zsh" /usr/local/share/zsh/site-functions/prompt_pure_setup
    ln -s "$out/async.zsh" /usr/local/share/zsh/site-functions/async
  '';
}