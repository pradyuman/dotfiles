# Patch emacs so it works better on darwin

final: prev: {
  emacsDarwin = prev.emacs30.overrideAttrs (old: {
    patches = (old.patches or [ ]) ++ [
      # Fix OS window role so that yabai can pick up Emacs
      (prev.fetchpatch {
        url = "https://raw.githubusercontent.com/d12frosted/homebrew-emacs-plus/master/patches/emacs-28/fix-window-role.patch";
        sha256 = "+z/KfsBm1lvZTZNiMbxzXQGRTjkCFO4QPlEK35upjsE=";
      })
    ];
  });
}
