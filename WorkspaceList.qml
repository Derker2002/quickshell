import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland

Rectangle {
    id: root
    color: "transparent"
    // radius: 3
    
    implicitWidth: layout.implicitWidth
    implicitHeight: layout.implicitHeight
    property list<string> icons : ["arch","terminal","web","code","music","message"]
    RowLayout {
        id: layout
        anchors.fill: parent
        spacing: ScreenTools.spacings

        Repeater {
            model: Hyprland.workspaces
            BracketTextButton {
                id:btn
                implicitHeight: parent.height
                required property HyprlandWorkspace modelData
                checkable: true
                sticky: true
                checked: modelData.active
                centralText.text:modelData.id >= root.icons.length ? btn.modelData.id : GlyphProvider.glyphFor(root.icons[Math.max(0,btn.modelData.id)])
                onClicked:{
                    btn.modelData.activate();
                }
                Connections{
                    target: btn.modelData
                    function onActiveChanged(){btn.checked = btn.modelData.active;} 
                }
            }
        }
    }
}
