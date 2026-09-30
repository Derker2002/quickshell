import QtQuick
import Quickshell.Io
import Quickshell.Hyprland

BracketTextButton {
    id: root
    showBrackets: true
    centralText.font.bold: true
    centralText.text : HyprlandXkb.currentLayoutCode
    centralText.width: 19
}
