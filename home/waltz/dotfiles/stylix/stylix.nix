{ inputs, pkgs,  ... }:
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
                    package = (pkgs.nerdfonts.override { fonts = [ "Noto" ]; });
                    name = "Noto Nerd Font Mono";
                };
                
                sansSerif = {
                    package = (pkgs.nerdfonts.override { fonts = [ "Noto" ]; });
                    name = "Noto Nerd Font Mono";
                };

                monospace = {
                    package = (pkgs.nerdfonts.override { fonts = [ "Noto" ]; });
                    name = "Noto Nerd Font Mono";
                };

		sizes.applications = 12;
		sizes.desktop = 12;
            };

	    targets = {
	      plymouth.blackBackground = true;
	    };
	};
}
