{
  inputs,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    inputs.nix-orion.homeModules.default
  ];

  programs.orion = lib.mkIf pkgs.stdenv.isDarwin {
    enable = true;

    settings = {
      # Search & navigation
      DefaultSearchEngine = "Google";
      NewTabOpensTo = "frequentlyVisitedSites"; # Start Page

      # Tabs
      TabStyle = "treeStyle";
      TabSwitchingOrder = "byRecentlyUsed";
      ShowTitlesInTabs = true;
      TabsShowFavicons = true;
      ShowTabPreviewOnHover = false;
      UseTabSwitcherUI = true;

      # Appearance
      CustomAppIcon = "appicon3";
      CurrentToolbarSize = "small";
      BookmarksBarVisible = false;
      StatusBarVisible = false;

      # Start page
      ShowBackgroundImageOnStartPage = false;
      ShowFavoritesOnStartPage = false;
      ShowRecommendationsOnStartPage = false;
      ShowTopSitesOnStartPage = false;
      ShowRssFeedsButton = false;

      # Behavior
      AllowChromeWebExtensions = false;
      AllowFirefoxWebExtensions = false;
      AutofillEnabled = false;
      PasswordProvider = "none";
      PasswordSavingEnabled = false;
      ExperimentalFeatures = {
        "Prefer Page Rendering Updates near 120fps" = true;
      };

      # Menu shortcut overrides (macOS App Shortcuts)
      NSUserKeyEquivalents = {
        "Show Sidebar" = "@s";
        "Hide Sidebar" = "@s";

        # Save Page holds cmd-s by default.
        # It must move for the sidebar binding to work.
        "Save Page…" = "@^s";
      };
    };
  };
}
