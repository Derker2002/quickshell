import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell.Services.UPower

BracketButton {
    id: root
    property alias showPercentage: percentage.visible
    property alias showIndicator: batteryIcon.visible
    showBrackets: false
    readonly property var battery: UPower.displayDevice
    property color color: battery.percentage < 0.25 ? MyPalette.red:MyPalette.accentText //
    property int animStateIndex: 0
    defaultBackground:activeBackground
    hoverBackground:activeBackground
    Timer {
        id: chargingTimer
        running: root.battery.state == UPowerDeviceState.Charging
        repeat: true
        interval: 500
        onTriggered: {
            root.animStateIndex++;
            if (root.animStateIndex > 4) {
                root.animStateIndex = 0;
            }
        }
    }
    
    centerItem: RowLayout {
        spacing:0
        Text {
            id: percentage
            color:root.color
            text: Math.ceil(root.battery.percentage * 100) + '%'
            Layout.leftMargin:ScreenTools.margins
            Layout.rightMargin:ScreenTools.margins
            // Layout.preferredWidth:42
        }
        Text {
            Layout.leftMargin:ScreenTools.margins
            Layout.rightMargin:ScreenTools.margins
            Layout.alignment: Qt.AlignVCenter
            id: batteryIcon
            color:root.color
            visible: root.showIndicator
            font.pixelSize: 20
            text: {
                if (root.battery.state == UPowerDeviceState.Charging) {
                    return GlyphProvider.glyphFor("battery_"+root.animStateIndex);
                } else {
                    return GlyphProvider.glyphFor("battery_"+Math.floor(root.battery.percentage * 4));
                }
            }
        }
    }
}
