import QtQuick
import Quickshell.Io

Item {
    id: root
    implicitWidth: barsRow.implicitWidth
    implicitHeight: barsRow.implicitHeight

    property int barCount: 40
    property int maxVal: 20
    property int channelSpacing: 160        // gap between L and R channels
    property var barValues: Array(barCount).fill(0)

    Process {
        id: cavaProc
        command: ["cava"]
        running: true
        stdout: SplitParser {
            splitMarker: "\n"
            onRead: data => {
                const parts = data.trim().split(";").filter(s => s.length > 0)
                if (parts.length === root.barCount) {
                    root.barValues = parts.map(v => parseInt(v));
                }
            }
        }
    }

    Row {
        id: barsRow
        spacing: root.channelSpacing
        anchors.fill: parent

        // Left channel (bars 0–19)
        Row {
            spacing: 3
            height: parent.height

            Repeater {
                model: root.barCount / 2
                Rectangle {
                    required property int index
                    width: 5
                    height: barsRow.height
                    color: "transparent"

                    Rectangle {
                        width: parent.width
                        height: (root.barValues[root.barCount / 2 - parent.index - 1] / root.maxVal) * parent.height
                        anchors.verticalCenter: parent.verticalCenter
                        color: MyPalette.darkBackground
                        radius: 3
                    }
                }
            }
        }

        // Right channel (bars 20–39)
        Row {
            spacing: 3
            height: parent.height

            Repeater {
                model: root.barCount / 2
                Rectangle {
                    required property int index
                    width: 5
                    height: barsRow.height
                    color: "transparent"

                    Rectangle {
                        width: parent.width
                        height: (root.barValues[ root.barCount - parent.index -1 ] / root.maxVal) * parent.height
                        anchors.verticalCenter: parent.verticalCenter
                        color: MyPalette.darkBackground
                        radius: 3
                    }
                }
            }
        }
    }
}