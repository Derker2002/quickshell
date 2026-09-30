import Quickshell.Services.SystemTray
import Quickshell
import Quickshell.Io
import QtQuick

Row {
    signal showMenu(QsMenuHandle hndl)
    id: row
    leftPadding: ScreenTools.paddings
    rightPadding: ScreenTools.paddings
    spacing: ScreenTools.spacings
    Repeater {
        model: SystemTray.items
        delegate: BracketTextButton {
            id: button
            required property var modelData
            showBrackets:false
            row.padding: ScreenTools.paddings
            centralText.text: GlyphProvider.glyphFor(modelData.id)
            onClicked: {
                if (modelData.hasMenu) {
                    modelData.display(this, 0, 0);
                }
                if(modelData.id=="blueman"){
                    bluetoothManager.running = true
                }
            }
        }
    }
    Process{
        id:bluetoothManager
        running:false
        command:["blueman-manager"]
    }
}
