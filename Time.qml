import QtQuick
import QtQuick.Layouts

BracketButton {
    id: time
    checkable: true
    checked: true
    sticky: true
    row.leftPadding:ScreenTools.paddings*5
    row.rightPadding:ScreenTools.paddings*5
    centerItem: Text {
        text: TimeServer.time
        font.bold: true
        color: time.textColor
    }
}
