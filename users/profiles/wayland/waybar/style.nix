{
  fontProfiles,
  colors,
}: let
  regular = fontProfiles.regular.family;
  monospace = fontProfiles.monospace.family;
  base = colors.base;
in ''
  window#waybar {
    background: ${base.background};
    color: ${base.foreground};
  }
  #custom-launcher {
    border-radius: 4px;
    color: ${base.background};
    background: ${base.blue};
    margin: 6px;
    font-family: ${regular};
    font-size: 22px;
  }
  #workspaces {
    font-family: ${monospace} Mono;
    font-size: 24px;
  }
  #workspaces button {
    all: unset;
    border-radius: 4px;
    transition: all ease 0.6s;
    margin: 2px 6px;
  }
  #workspaces button:hover {
    background: ${base.dimblack};
  }
  #workspaces button.active {
    color: ${base.magenta};
    background: ${base.black};
    border-left: solid 1px ${base.magenta};
    border-top-left-radius: 0px;
    border-bottom-left-radius: 0px;
  }
  #keyboard-state {
    font-family: ${monospace};
    font-size: 14px;
    padding-right: 6px;
    color: ${base.yellow};
  }
  #custom-settings {
    all: unset;
    font-family: ${monospace} Mono;
    font-size: 20px;
    margin: 6px 6px 0px 6px;
    padding: 0px 2px 0px 0px;
    color: ${base.foreground};
    background-color: ${base.black};
    border-radius: 4px;
  }
  #pulseaudio {
    border-top-left-radius: 4px;
    border-top-right-radius: 4px;
    font-size: 26px;
    font-family: ${regular};
    color: ${base.cyan};
    background-color: ${base.black};
    margin: 6px 6px 0px 6px;
  }
  #network {
    border-bottom-left-radius: 4px;
    border-bottom-right-radius: 4px;
    font-size: 14px;
    font-family: ${monospace};
    padding: 4px 7px 6px 0px;
    margin: 0px 6px 6px 6px;
  }
  #custom-hour {
    margin: 0px 6px;
    padding-top: 4px;
    font-family: ${monospace};
    font-size: 13px;
    border-top-left-radius: 4px;
    color: ${base.foreground};
    background-color: ${base.black};
    border-top-right-radius: 4px;
  }
  #custom-mins {
    border-bottom-left-radius: 4px;
    border-bottom-right-radius: 4px;
    padding: 4px 0px;
    margin-bottom: 4px;
    color: ${base.foreground};
    background-color: ${base.black};
    font-family: ${monospace};
    font-size: 13px;
    margin-left: 6px;
    margin-right: 6px;
  }
  #custom-powermenu {
    all: unset;
    font-family: ${monospace} Mono;
    font-size: 20px;
    margin: 0px 6px 4px;
    border-radius: 4px;
    color: ${base.red};
    background-color: ${base.black};
  }
''
