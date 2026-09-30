import QtQuick

Rectangle {
    id: root
    radius:ScreenTools.radius/2
    property bool checkable: false
    property bool checked: false
    property bool sticky: false

    property color activeBackground: MyPalette.darkBackground
    property color pressedBackground: MyPalette.grayBackground
    property color defaultBackground: MyPalette.buttonBackground
    property color hoverBackground: MyPalette.darkBackground
    property alias hoverCursor: mouseArea.cursorShape
    default property alias contentItem: item.data

    signal clicked()
    signal toggled(bool active)
    signal wheel(WheelEvent wheel)
    signal pressed()
    signal released()
    signal entered()
    signal exited()

    property bool pressedState: mouseArea.pressed
    property bool hovered: mouseArea.containsMouse

    color: {
        if (pressedState)
            return pressedBackground
        if (checkable && checked)
            return activeBackground
        if (hovered)
            return hoverBackground
        return defaultBackground
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor

        onEntered: root.entered()
        onExited: root.exited()
        onWheel :(wheel)=>{root.wheel(wheel)}
        onPressed: root.pressed()
        onReleased: root.released()
        onClicked: {
            root.clicked()
            if (root.checkable && (!root.sticky || !root.checked)) {
                root.checked = !root.checked
                root.toggled(root.checked)
            }
        }
    }

    Item {
        id: item
        anchors.centerIn:parent
    }

    
}
