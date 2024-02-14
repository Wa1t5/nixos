{ inputs, pkgs,  ... }:

  let 
    fontPkg = ( pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; });
    fontName = "JetBrainsMono Medium";
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
                serif = {
                    package = fontPkg;
                    name = fontName;
                };
                
                sansSerif = {
                    package = fontPkg;
		    name = fontName;
                };

                monospace = {
                    package = fontPkg;
		    name = fontName;
                };

		sizes.applications = 12;
		sizes.desktop = 12;
            };

	    targets = {
	      plymouth.blackBackground = true;
	    };
	};
}
