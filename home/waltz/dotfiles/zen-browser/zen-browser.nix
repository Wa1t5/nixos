{
  inputs,
  osConfig,
  lib,
  ...
}:
{
  imports = [ inputs.zen-browser.homeModules.beta ];

  programs.zen-browser = {
    enable = lib.mkIf (!osConfig.headless.enable) true;
    setAsDefaultBrowser = true;

    policies = {
      Preferences = {
        "browser.tabs.allow_transparent_browser" = {
          Value = true;
          Status = "locked";
        };

        "zen.widget.linux.transparency" = {
          Value = true;
          Status = "locked";
        };
      };

      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
    };
  };
}
