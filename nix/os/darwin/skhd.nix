{
  services.skhd = {
    enable = true;
    skhdConfig = ''
      # focus window
      ctrl - h : yabai -m window --focus west
      ctrl - j : yabai -m window --focus south
      ctrl - k : yabai -m window --focus north
      ctrl - l : yabai -m window --focus east
      ctrl - a : yabai -m window --focus recent

      # focus monitor
      ctrl - 1 : yabai -m display --focus 1
      ctrl - 2 : yabai -m display --focus 2
      ctrl - 3 : yabai -m display --focus 3

      # swap window
      cmd + ctrl - h : yabai -m window --swap west
      cmd + ctrl - j : yabai -m window --swap south
      cmd + ctrl - k : yabai -m window --swap north
      cmd + ctrl - l : yabai -m window --swap east

      # move window
      shift + ctrl - h : yabai -m window --warp west
      shift + ctrl - j : yabai -m window --warp south
      shift + ctrl - k : yabai -m window --warp north
      shift + ctrl - l : yabai -m window --warp east

      # balance size of windows
      cmd + ctrl - r : yabai -m space --balance

      # rotate tree
      ctrl - w : yabai -m space --rotate 90

      # mirror tree y-axis
      # ctrl - t : yabai -m space --mirror y-axis

      # mirror tree x-axis
      # ctrl - y : yabai -m space --mirror x-axis

      # send window to monitor and follow focus
      # ctrl + cmd - x  : yabai -m window --display recent; yabai -m display --focus recent
      # ctrl + cmd - z  : yabai -m window --display prev; yabai -m display --focus prev
      # ctrl + cmd - c  : yabai -m window --display next; yabai -m display --focus next
      cmd + ctrl - 1 : yabai -m window --display 1; yabai -m display --focus 1
      cmd + ctrl - 2 : yabai -m window --display 2; yabai -m display --focus 2
      cmd + ctrl - 3 : yabai -m window --display 3; yabai -m display --focus 3

      # toggle window fullscreen zoom
      ctrl - f : yabai -m window --toggle zoom-fullscreen

      # toggle window split type
      ctrl - e : yabai -m window --toggle split

      ####
      # these rely on SIP being disabled
      ####

      # fast focus desktop
      # alt - x : yabai -m space --focus recent
      # alt - z : yabai -m space --focus prev
      # alt - c : yabai -m space --focus next
      # alt - 1 : yabai -m space --focus 1
      # alt - 2 : yabai -m space --focus 2
      # alt - 3 : yabai -m space --focus 3
      # alt - 4 : yabai -m space --focus 4
      # alt - 5 : yabai -m space --focus 5
      # alt - 6 : yabai -m space --focus 6
      # alt - 7 : yabai -m space --focus 7
      # alt - 8 : yabai -m space --focus 8
      # alt - 9 : yabai -m space --focus 9
      # alt - 0 : yabai -m space --focus 10

      # send window to desktop and follow focus
      # shift + alt - x : yabai -m window --space recent; yabai -m space --focus recent
      # shift + alt - z : yabai -m window --space prev; yabai -m space --focus prev
      # shift + alt - c : yabai -m window --space next; yabai -m space --focus next
      # shift + alt - 1 : yabai -m window --space  1; yabai -m space --focus 1
      # shift + alt - 2 : yabai -m window --space  2; yabai -m space --focus 2
      # shift + alt - 3 : yabai -m window --space  3; yabai -m space --focus 3
      # shift + alt - 4 : yabai -m window --space  4; yabai -m space --focus 4
      # shift + alt - 5 : yabai -m window --space  5; yabai -m space --focus 5
      # shift + alt - 6 : yabai -m window --space  6; yabai -m space --focus 6
      # shift + alt - 7 : yabai -m window --space  7; yabai -m space --focus 7
      # shift + alt - 8 : yabai -m window --space  8; yabai -m space --focus 8
      # shift + alt - 9 : yabai -m window --space  9; yabai -m space --focus 9
      # shift + alt - 0 : yabai -m window --space 10; yabai -m space --focus 10

      # create desktop, move window and follow focus - uses jq for parsing json (brew install jq)
      # shift + cmd - n : yabai -m space --create && \
      #                   index="$(yabai -m query --spaces --display | jq 'map(select(."native-fullscreen" == 0))[-1].index')" && \
      #                   yabai -m window --space "''${index}" && \
      #                   yabai -m space --focus "''${index}"

      # create desktop and follow focus - uses jq for parsing json (brew install jq)
      # cmd + alt - n : yabai -m space --create && \
      #                 index="$(yabai -m query --spaces --display | jq 'map(select(."native-fullscreen" == 0))[-1].index')" && \
      #                 yabai -m space --focus "''${index}"

      # destroy desktop
      # cmd + alt - w : yabai -m space --destroy
      '';
  };
}