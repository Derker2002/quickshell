import QtQuick
import QtQuick.Controls
import Quickshell

PanelWindow {
    id:root
    exclusiveZone: 0
    implicitWidth: 400
    implicitHeight: 300
    color: "transparent"
    visible:true
    anchors {
        top: true
    }
    Rectangle {
        anchors.fill: parent
        color: MyPalette.widgetBackground
        bottomRightRadius: ScreenTools.radius
        bottomLeftRadius: ScreenTools.radius

        ListView {
            id: listview

            implicitWidth: parent.width / 2
            implicitHeight: parent.height
            snapMode: ListView.SnapOneItem
            orientation: ListView.Horizontal
            highlightRangeMode: ListView.StrictlyEnforceRange

            model: CalendarModel {
                from: new Date(2015, 0, 1)
                to: new Date(2015, 11, 31)
            }

            delegate: MonthGrid {
                width: listview.width
                height: listview.height

                month: model.month
                year: model.year
                locale: Qt.locale("en_US")
            }

            ScrollIndicator.horizontal: ScrollIndicator {}
        }
    }
    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onExited: {
            root.visible = false;
        }
    }
}
