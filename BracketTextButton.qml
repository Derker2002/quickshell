import QtQuick

BracketButton{
    id:root
    property alias centralText:textField
    centerItem:Text{
        anchors.centerIn: parent
        id:textField
        color:  root.textColor == Qt.rgba(0,0,0,0) ? MyPalette.text : root.textColor
    }
}