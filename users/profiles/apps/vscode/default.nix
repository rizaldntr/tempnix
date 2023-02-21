{
  config,
  pkgs,
  ...
}: {
  programs.vscode = {
    enable = true;
    userSettings = {
      "workbench.colorTheme" = "Decayce Theme";
      "workbench.iconTheme" = "material-icon-theme";
      "editor.bracketPairColorization.enabled" = false;
      "editor.fontFamily" = "${config.fontProfiles.monospace.family}";
      "editor.fontLigatures" = true;
      "editor.cursorStyle" = "line-thin";
      "editor.fontSize" = 16;
      "terminal.integrated.fontSize" = 16;
      "window.menuBarVisibility" = "toggle";
      "editor.tabSize" = 2;
      "editor.inlineSuggest.enabled" = true;
      "python.formatting.provider" = "black";
      "[python]" = {
        "editor.tabSize" = 4;
        "editor.formatOnSave" = true;
      };
    };
    extensions = with pkgs.vscode-extensions;
      [
        esbenp.prettier-vscode
        ms-python.python
        ms-python.vscode-pylance
        sumneko.lua
      ]
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "decay";
          publisher = "decaycs";
          version = "1.0.6";
          sha256 = "sha256-Jtxj6LmHgF7UNaXtXxHkq881BbuPtIJGxR7kdhKr0Uo=";
        }
        {
          name = "material-icon-theme";
          publisher = "pkief";
          version = "4.22.0";
          sha256 = "sha256-U9P9BcuZi+SUcvTg/fC2SkjGRD4CvgJEc1i+Ft2OOUc=";
        }
      ];
  };
}
