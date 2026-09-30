import QtQuick

DefaultButton {
    id: root
    implicitHeight: bracketRow.implicitHeight
    implicitWidth: bracketRow.implicitWidth

    property alias row:bracketRow
    property alias centerItem: cItem.data
    property bool  showBrackets: true
    property color activeBracketColor: MyPalette.accentText
    property color pressedBracketColor: MyPalette.accentText
    property color defaultBracketColor: MyPalette.buttonBackground
    property color hoverBracketColor: MyPalette.text
    property color textColor: {
        if (pressedState)
            return pressedBracketColor;
        if (checkable && checked)
            return activeBracketColor;
        if (hovered)
            return hoverBracketColor;
        return defaultBracketColor;
    }

    contentItem: Row {
        id: bracketRow
        leftPadding: ScreenTools.paddings
        rightPadding: ScreenTools.paddings
        bottomPadding: ScreenTools.paddings/2
        anchors {
            centerIn: parent
        }
        Text {
            id: lItem
            visible:root.showBrackets
            color: root.textColor
            text: GlyphProvider.glyphFor("open_bracket")
        }

        Item {
            id: cItem

            // Let cItem auto-size to its internal Row
            implicitWidth: childrenRect.width
            implicitHeight: childrenRect.height
        }

        Text {
            id: rItem
            color: root.textColor
            text: GlyphProvider.glyphFor("close_bracket")
            visible:root.showBrackets
        }
    }
}
