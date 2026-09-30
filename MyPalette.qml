pragma Singleton

import Quickshell
import QtQuick
// your singletons should always have Singleton as the type
Singleton {
    id:root
    readonly property color text: '#32302F'
    readonly property color accentText: '#FBF1C7'
    readonly property color grayBackground:'#8C8774'
    readonly property color backgroud:'#B3AC90'
    readonly property color darkBackground: '#827D6A'
    readonly property color buttonBackground: "transparent"
    readonly property color lightRed:'#7c4a4a'
    readonly property color red: '#ac1a1a'
    readonly property color lightYellow:'#7c794a'
    readonly property color yellow: '#acaa1a'
    readonly property color lightGreen:'#4a7c4c'
    readonly property color green: '#2dac1a'
    readonly property color lightPurple: '#6a4a7c'
    readonly property color purple: '#791aac'
    readonly property real  widgetBackgroundOpacity: 0.9
    readonly property color widgetBackground:Qt.rgba(backgroud.r,backgroud.g,backgroud.b,widgetBackgroundOpacity)
    readonly property color widgetDarkBackground:Qt.rgba(darkBackground.r,darkBackground.g,darkBackground.b,widgetBackgroundOpacity)
    readonly property color widgetGrayBackground:Qt.rgba(grayBackground.r,grayBackground.g,grayBackground.b,widgetBackgroundOpacity)
}


/*
#FBF1C7
#EBDBB2
#D5C4A1
#BDAE93
#928374
#7C6F64
#665C54
#504945
#3C3836
#32302F


#83A598


*/