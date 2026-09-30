import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io

PopupWindow {
    implicitWidth: root.implicitWidth
    implicitHeight: root.implicitHeight
    color: "transparent"
    signal leaved
    Rectangle {
        id: root
        color: MyPalette.widgetBackground
        bottomLeftRadius: ScreenTools.radius
        bottomRightRadius: ScreenTools.radius
        implicitHeight: list.implicitHeight
        implicitWidth: list.width
        ColumnLayout {
            id: list
            spacing: 5
            
            BracketTextButton {
                Layout.fillWidth:true
                Layout.leftMargin:ScreenTools.margins
                Layout.rightMargin:ScreenTools.margins
                id: pwrOffBtn
                hoverBackground: MyPalette.lightRed
                centralText.text: "Power Off " + GlyphProvider.glyphFor("power_off")
                onClicked: pwrOfProc.running = true
            }
            BracketTextButton {
                Layout.fillWidth:true
                Layout.leftMargin:ScreenTools.margins
                Layout.rightMargin:ScreenTools.margins
                id: rebootBtn
                width: pwrOffBtn.width
                hoverBackground: MyPalette.lightYellow
                centralText.text: "Reboot " + GlyphProvider.glyphFor("reboot")
                onClicked: rebootProc.running = true
            }
            BracketTextButton {
                Layout.fillWidth:true
                Layout.leftMargin:ScreenTools.margins
                Layout.rightMargin:ScreenTools.margins
                id: logOffBtn
                hoverBackground: MyPalette.lightGreen
                centralText.text: "Log Out " + GlyphProvider.glyphFor("lock")
                onClicked: logOutProc.running = true
            }

             BracketTextButton {
                Layout.fillWidth:true
                Layout.leftMargin:ScreenTools.margins
                Layout.rightMargin:ScreenTools.margins
                Layout.bottomMargin:ScreenTools.margins
                id: sleepBtn
                hoverBackground: MyPalette.lightPurple
                centralText.text: "Sleep " + GlyphProvider.glyphFor("sleep")
                onClicked: sleepProc.running = true
            }
        }
    }
    Connections {
        target: handler
    }
    HoverHandler {
        id: handler
        target: parent
        // cursorShape:Qt.PointingHandCursor
        onHoveredChanged: {
            if (!hovered) {
                leaved();
            }
        }
    }

    Process{
        id:pwrOfProc
        command: ["poweroff"]
        running:false
    }
    Process{
        id:rebootProc
        command: ["reboot"]
        running:false
    }
    Process{
        id:logOutProc
        command: ["hyprctl","dispatch exit"]
        running:false
    }
     Process{
        id:sleepProc
        command: ["sleep"]
        running:false
    }
}
