{ stdenv, pkgs, ...}:

stdenv.mkDerivation rec {
  version = "1.10.3";
  name = "pure-prompt-${version}";

  src = pkgs.fetchFromGitHub {
    owner = "sindresorhus";
    repo = "pure";
    rev = "v${version}";
    sha256 = "0zjgnlw01ri0brx108n6miw4y0cxd6al1bh28m8v8ygshm94p1zx";
  };

  installPhase = ''
    mkdir $out
    cp -r * $out
    ln -sf "$out/pure.zsh" /usr/local/share/zsh/site-functions/prompt_pure_setup
    ln -sf "$out/async.zsh" /usr/local/share/zsh/site-functions/async
  '';
}