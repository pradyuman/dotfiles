{ lib, pkgs, ... }:

{
  # Merged into Orion's plist on activation via `defaults import`
  # Keys not listed here (window state, content blockers, etc) are untouched.
  targets.darwin.defaults."com.kagi.kagimacOS" = lib.mkIf pkgs.stdenv.isDarwin {
    # Search & navigation
    DefaultSearchEngine = "Google";
    NewTabOpensTo = "frequentlyVisitedSites"; # Start Page

    # Tabs
    TabStyle = "treeStyle";
    TabSwitchingOrder = "byIndex";
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
    ShowReadingListOnStartPage = false;
    ShowRecommendationsOnStartPage = false;
    ShowTopSitesOnStartPage = false;
    ShowRssFeedsButton = false;

    # Behavior
    PasswordProvider = "none";
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
}
