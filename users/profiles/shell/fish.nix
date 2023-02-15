{pkgs, ...}: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      eval "$(${pkgs.starship}/bin/starship init fish)"
      eval "$(${pkgs.direnv}/bin/direnv hook fish)"
      set fish_greeting
    '';
    plugins = [
      {
        name = "z";
        src = pkgs.fetchFromGitHub {
          owner = "jethrokuan";
          repo = "z";
          rev = "e0e1b9dfdba362f8ab1ae8c1afc7ccf62b89f7eb";
          sha256 = "0dbnir6jbwjpjalz14snzd3cgdysgcs3raznsijd6savad3qhijc";
        };
      }
    ];
    shellAliases = {
      # git
      g = "git";
      gst = "git status";
      gd = "git diff";
      gdc = "git diff --cached";
      gl = "git pull";
      gup = "git pull --rebase";
      gp = "git push";
      glo = "git log --oneline";

      #  nix
      nrb = "sudo nixos-rebuild";
      nso = "sudo nix-store --optimise";
      ncgd = "sudo nix-collect-garbage -d";

      # lazy
      ld = "lazydocker";
    };
  };
}
