{ inputs, pkgs, ... }:
{
    imports = [ inputs.spicetify-nix.homeManagerModules.default ];

    programs.spicetify = 
        let spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    in
    {
        enable = true;

        theme = {
            name = "hazy";
            src = pkgs.fetchgit {
                url = "https://github.com/spicetify/spicetify-themes";
                rev = "0893ed8938f1fdc05d34e5c989941358f479ad84";
                sha256 = "04ajrxn539ygrkfp4wz0pkjf229058wbrgjd1gwv0arspflp7yb6";
            };

            injectCss = true;
            injectThemeJs = true;
            replaceColors = true;
            homeConfig = true;
            overwriteAssets = false;
            additonalCss = "";
        };

        enabledExtensions = with spicePkgs.extensions; [
            adblockify
        ];
    };
}