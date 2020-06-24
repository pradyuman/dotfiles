{
  services.skhd = {
    enable = true;
    skhdConfig = ''
      # focus window
      alt - h : yabai -m window --focus west
      alt - j : yabai -m window --focus south
      alt - k : yabai -m window --focus north
      alt - l : yabai -m window --focus east

      # fast focus desktop
      alt - x : yabai -m space --focus recent
      alt - z : yabai -m space --focus prev
      alt - c : yabai -m space --focus next
      alt - 1 : yabai -m space --focus 1
      alt - 2 : yabai -m space --focus 2
      alt - 3 : yabai -m space --focus 3
      alt - 4 : yabai -m space --focus 4
      alt - 5 : yabai -m space --focus 5
      alt - 6 : yabai -m space --focus 6
      alt - 7 : yabai -m space --focus 7
      alt - 8 : yabai -m space --focus 8
      alt - 9 : yabai -m space --focus 9
      alt - 0 : yabai -m space --focus 10

      # focus monitor
      alt - a  : yabai -m display --focus recent

      # swap window
      cmd + alt - h : yabai -m window --swap west
      cmd + alt - j : yabai -m window --swap south
      cmd + alt - k : yabai -m window --swap north
      cmd + alt - l : yabai -m window --swap east

      # move window
      shift + alt - h : yabai -m window --warp west
      shift + alt - j : yabai -m window --warp south
      shift + alt - k : yabai -m window --warp north
      shift + alt - l : yabai -m window --warp east

      # balance size of windows
      shift + alt - 0 : yabai -m space --balance

      # rotate tree
      alt - r : yabai -m space --rotate 90

      # mirror tree y-axis
      alt - y : yabai -m space --mirror y-axis

      # mirror tree x-axis
      alt - x : yabai -m space --mirror x-axi

      # send window to desktop and follow focus
      shift + alt - x : yabai -m window --space recent; yabai -m space --focus recent
      shift + alt - z : yabai -m window --space prev; yabai -m space --focus prev
      shift + alt - c : yabai -m window --space next; yabai -m space --focus next
      shift + alt - 1 : yabai -m window --space  1; yabai -m space --focus 1
      shift + alt - 2 : yabai -m window --space  2; yabai -m space --focus 2
      shift + alt - 3 : yabai -m window --space  3; yabai -m space --focus 3
      shift + alt - 4 : yabai -m window --space  4; yabai -m space --focus 4
      shift + alt - 5 : yabai -m window --space  5; yabai -m space --focus 5
      shift + alt - 6 : yabai -m window --space  6; yabai -m space --focus 6
      shift + alt - 7 : yabai -m window --space  7; yabai -m space --focus 7
      shift + alt - 8 : yabai -m window --space  8; yabai -m space --focus 8
      shift + alt - 9 : yabai -m window --space  9; yabai -m space --focus 9
      shift + alt - 0 : yabai -m window --space 10; yabai -m space --focus 10

      # send window to monitor and follow focus
      ctrl + cmd - x  : yabai -m window --display recent; yabai -m display --focus recent
      ctrl + cmd - z  : yabai -m window --display prev; yabai -m display --focus prev
      ctrl + cmd - c  : yabai -m window --display next; yabai -m display --focus next
      ctrl + cmd - 1  : yabai -m window --display 1; yabai -m display --focus 1
      ctrl + cmd - 2  : yabai -m window --display 2; yabai -m display --focus 2
      ctrl + cmd - 3  : yabai -m window --display 3; yabai -m display --focus 3

      # move window
      shift + ctrl - a : yabai -m window --move rel:-20:0
      shift + ctrl - s : yabai -m window --move rel:0:20
      shift + ctrl - w : yabai -m window --move rel:0:-20
      shift + ctrl - d : yabai -m window --move rel:20:0

      # make floating window fill screen
      shift + alt - up     : yabai -m window --grid 1:1:0:0:1:1

      # make floating window fill left-half of screen
      shift + alt - left   : yabai -m window --grid 1:2:0:0:1:1

      # make floating window fill right-half of screen
      shift + alt - right  : yabai -m window --grid 1:2:1:0:1:1

      # create desktop, move window and follow focus - uses jq for parsing json (brew install jq)
      shift + cmd - n : yabai -m space --create && \
                        index="$(yabai -m query --spaces --display | jq 'map(select(."native-fullscreen" == 0))[-1].index')" && \
                        yabai -m window --space "''${index}" && \
                        yabai -m space --focus "''${index}"

      # create desktop and follow focus - uses jq for parsing json (brew install jq)
      cmd + alt - n : yabai -m space --create && \
                      index="$(yabai -m query --spaces --display | jq 'map(select(."native-fullscreen" == 0))[-1].index')" && \
                      yabai -m space --focus "''${index}"

      # destroy desktop
      cmd + alt - w : yabai -m space --destroy

      # increase window size
      shift + alt - a : yabai -m window --resize left:-20:0
      shift + alt - s : yabai -m window --resize bottom:0:20
      shift + alt - w : yabai -m window --resize top:0:-20
      shift + alt - d : yabai -m window --resize right:20:0

      # decrease window size
      shift + cmd - a : yabai -m window --resize left:20:0
      shift + cmd - s : yabai -m window --resize bottom:0:-20
      shift + cmd - w : yabai -m window --resize top:0:20
      shift + cmd - d : yabai -m window --resize right:-20:0

      # set insertion point in focused container
      ctrl + alt - h : yabai -m window --insert west
      ctrl + alt - j : yabai -m window --insert south
      ctrl + alt - k : yabai -m window --insert north
      ctrl + alt - l : yabai -m window --insert east

      # toggle window fullscreen zoom
      alt - f : yabai -m window --toggle zoom-fullscreen

      # toggle window native fullscreen
      shift + alt - f : yabai -m window --toggle native-fullscreen

      # toggle window split type
      alt - e : yabai -m window --toggle split

      # float / unfloat window and center on screen
      alt - t : yabai -m window --toggle float;\
                yabai -m window --grid 4:4:1:1:2:2

      # toggle sticky (show on all spaces)
      alt - s : yabai -m window --toggle sticky

      # toggle topmost (keep above other windows)
      alt - o : yabai -m window --toggle topmost

      # toggle sticky, topmost and resize to picture-in-picture size
      alt - p : yabai -m window --toggle sticky;\
                yabai -m window --toggle topmost;\
                yabai -m window --grid 5:5:4:0:1:1
      '';
  };
}