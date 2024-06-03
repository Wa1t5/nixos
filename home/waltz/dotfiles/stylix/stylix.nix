{ inputs, pkgs,  ... }:
  let 
    fontPkg = ( pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" "Noto" ]; });
    fontDefName = "JetBrains Mono";
    fontEmojiName = "Noto Emoji";
  in
{ 
        stylix = {
            image = ./wallpaper.png;            
            polarity = "dark";
            autoEnable = true;

            opacity.desktop = 0.0;
            opacity.popups = 1.0;
            opacity.terminal = 0.7;

            cursor = {
                size = 16;
                name = "DMZ-Black";
            };
            
            fonts = {

		emoji = {
		  package = fontPkg;
		  name = fontEmojiName;
		};
                serif = {
		  name = fontDefName;
		  package = fontPkg;
		};
                sansSerif = {
		  name = fontDefName;
		  package = fontPkg;
		};
                monospace = {
		  name = fontDefName;
		  package = fontPkg;
		};

		sizes.applications = 12;
		sizes.desktop = 12;
            };

	    #targets = {
	    #  plymouth.blackBackground = true;
	    #};
	};
}
