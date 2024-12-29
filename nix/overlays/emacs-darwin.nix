# Patch emacs so it works better on darwin

final: prev: {
  emacsDarwin = prev.emacs29.overrideAttrs (old: {
    patches = (old.patches or [ ]) ++ [
      # Don't raise another frame when closing a frame
      (prev.fetchpatch {
        url = "https://raw.githubusercontent.com/d12frosted/homebrew-emacs-plus/master/patches/emacs-28/no-frame-refocus-cocoa.patch";
        sha256 = "QLGplGoRpM4qgrIAJIbVJJsa4xj34axwT3LiWt++j/c=";
      })
      # Fix OS window role so that yabai can pick up Emacs
      (prev.fetchpatch {
        url = "https://raw.githubusercontent.com/d12frosted/homebrew-emacs-plus/master/patches/emacs-28/fix-window-role.patch";
        sha256 = "+z/KfsBm1lvZTZNiMbxzXQGRTjkCFO4QPlEK35upjsE=";
      })
    ];
  });
}
