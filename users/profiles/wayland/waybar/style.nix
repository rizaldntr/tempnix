{ fontProfiles }: ''
#custom-launcher {
  border-radius: 4px;
  margin: 6px;
  font-family: ${fontProfiles.regular.family};
  font-size: 22px;
}
#workspaces {
  font-family: ${fontProfiles.monospace.family} Mono;
  font-size: 24px;
}
#workspaces button {
  all: unset;
  border-radius: 4px;
  transition: all ease 0.6s;
  margin: 2px 6px;
}

#workspaces button.active {
  border-top-left-radius: 0px;
  border-bottom-left-radius: 0px;
}
#keyboard-state {
  font-family: ${fontProfiles.monospace.family};
  font-size: 14px;
  padding-right: 6px;
}
#custom-settings {
  all: unset;
  font-family: ${fontProfiles.monospace.family} Mono;
  font-size: 20px;
  margin: 6px 6px 0px 6px;
  padding: 0px 2px 0px 0px;
  border-radius: 4px;
}
#pulseaudio {
  border-top-left-radius: 4px;
  border-top-right-radius: 4px;
  font-size: 26px;
  font-family: ${fontProfiles.regular.family};
  margin: 6px 6px 0px 6px;
}
#network {
  border-bottom-left-radius: 4px;
  border-bottom-right-radius: 4px;
  font-size: 14px;
  font-family: ${fontProfiles.monospace.family};
  padding: 4px 7px 6px 0px;
  margin: 0px 6px 6px 6px;
}
#custom-hour {
  margin: 0px 6px;
  padding-top: 4px;
  font-family: ${fontProfiles.monospace.family};
  font-size: 13px;
  border-top-left-radius: 4px;
  border-top-right-radius: 4px;
}
#custom-mins {
  border-bottom-left-radius: 4px;
  border-bottom-right-radius: 4px;
  padding: 4px 0px;
  margin-bottom: 4px;
  font-family: ${fontProfiles.monospace.family};
  font-size: 13px;
  margin-left: 6px;
  margin-right: 6px;
}
#custom-powermenu {
  all: unset;
  font-family: ${fontProfiles.monospace.family} Mono;
  font-size: 20px;
  margin: 0px 6px 4px;
  border-radius: 4px;
}
''