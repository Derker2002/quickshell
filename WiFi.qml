import QtQuick
import QtQuick.Layouts
import Quickshell.Io
import Quickshell.Networking

DefaultButton {
    id: root
    defaultBackground: activeBackground
    property alias showIndicator: indicator.visible
    property alias showExtended: extended.visible
    width: row.implicitWidth
    contentItem: RowLayout {
        id: row
        spacing: 0
        anchors.verticalCenter: parent.verticalCenter
        anchors.centerIn: parent
        Text {
            id: extended
            color: MyPalette.accentText
            text: ""
            Layout.leftMargin: 4
            Layout.rightMargin: 4
        }
        Text {
            id: indicator
            property int signalStrength
            visible: network.wifiEnabled
            text: GlyphProvider.glyphFor("lan")
            font.pixelSize: 20
            color: MyPalette.accentText
            Layout.leftMargin: 4
            Layout.rightMargin: 4
        }
    }
    onClicked: {
        openNMManager.running = true;
    }
    Component.onCompleted: {
        let deviceList = Networking.devices
        console.log("logging\n length of devices: " + deviceList.values.length)
        for (let i=0;i<deviceList.values.length;++i) {
            console.log(deviceList.values[i].name)
        }
    }
    Process {
        id: openNMManager
        running: false
        command: ["nm-connection-editor"]
    }
}
