{ lib, pkgs, ... }:

let
  asidePolicy = (pkgs.formats.plist { }).generate "at.studio.AsideBrowser.plist" {
    ExtensionSettings = {
      # 1Password - Password Manager
      "aeblfdkhhhdcdjpifhhbdiojplfjncoa" = {
        installation_mode = "force_installed";
        update_url = "https://clients2.google.com/service/update2/crx";
      };
    };
  };
in
{
  # Aside is Chromium-based and reads forced extension installs from Chromium's
  # enterprise policy provider. On macOS, those platform policies live in
  # managed preferences. This script writes the generated plist to the bundle-id
  # path that Aside's sandbox allows, then restarts cfprefsd so the copied file
  # is noticed.
  system.activationScripts.extraActivation.text = lib.mkAfter ''
    echo >&2 "aside browser policy..."
    mkdir -p "/Library/Managed Preferences"
    install -m 0644 -o root -g wheel ${asidePolicy} "/Library/Managed Preferences/at.studio.AsideBrowser.plist"
    killall cfprefsd || true
  '';
}
