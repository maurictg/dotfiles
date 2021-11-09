#!/bin/sh
## Touchpad click on tap
cat << EOF > /etc/X11/xorg.conf.d/90-touchpad.conf
Section "InputClass"
        Identifier "touchpad"
        MatchIsTouchpad "on"
        Driver "libinput"
        Option "Tapping" "on"
        Option "TappingButtonMap" "lrm"
        Option "ScrollMethod" "twofinger"
EndSection
EOF