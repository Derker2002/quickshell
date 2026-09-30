pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Io
import Quickshell.Services.Mpris
import Quickshell.Services.Pipewire

Variants{
    model: Quickshell.screens;

    delegate: ShellRoot {
        required property var modelData
    id: root
    PanelWindow {
        screen: modelData

        id: topBar
        // exclusiveZone: height
        color: 'transparent'
        aboveWindows: false
        margins {
            left: ScreenTools.margins
            right: ScreenTools.margins
            top: ScreenTools.margins
        }
        anchors {
            top: true
            left: true
            right: true
        }
        implicitHeight: 30
        Rectangle {
            id: backgroud
            anchors.fill: parent
            radius: ScreenTools.radius
            bottomRightRadius: pwrCtlButton.checked ? 0 : ScreenTools.radius
            color: MyPalette.backgroud
        }

        // SystemTray {
        //     id: sysTray
        //     anchors {
        //         verticalCenter: parent.verticalCenter
        //         left: time.right
        //         leftMargin: ScreenTools.margins
        //     }
        //     onShowMenu: menu => {
        //         menuShower.menu = menu;
        //         menuShower.open();
        //     }
        // }

        Time {
            id: time
            anchors {
                top: parent.top
                horizontalCenter: parent.horizontalCenter
                bottom: parent.bottom
            }
            onClicked: calendar.visible = !calendar.visible
        }

        WorkspaceList {
            anchors {
                top: parent.top
                bottom: parent.bottom
                left: parent.left
                leftMargin: ScreenTools.margins
                topMargin: ScreenTools.margins
                bottomMargin: ScreenTools.margins
            }
        }

        Cava {
            anchors {
                top: parent.top
                bottom: parent.bottom
                horizontalCenter: parent.horizontalCenter
                rightMargin: ScreenTools.margins
                topMargin: ScreenTools.margins
                bottomMargin: ScreenTools.margins
            }
            channelSpacing: 160
        }
        


        Player{
            anchors {
                top: parent.top
                bottom: parent.bottom
                right: sound.left
                rightMargin: ScreenTools.margins
                topMargin: ScreenTools.margins
                bottomMargin: ScreenTools.margins
            }
        }

        
        // WiFi {
        //     id:wifi
        //     anchors {
        //         right: battery.left
        //         top: parent.top
        //         bottom: parent.bottom
        //         topMargin: ScreenTools.margins
        //         bottomMargin: ScreenTools.margins
        //         rightMargin: ScreenTools.margins
        //     }
        //     showIndicator: true
        // }
        
        Sound{
            id:sound
            anchors {
                right: kbLayout.left
                top: parent.top
                bottom: parent.bottom
                topMargin: ScreenTools.margins
                bottomMargin: ScreenTools.margins
                rightMargin: ScreenTools.margins
            }
        }
        KeyboardLayout {
            id: kbLayout
            anchors {
                right: battery.left
                top: parent.top
                bottom: parent.bottom
                topMargin: ScreenTools.margins
                bottomMargin: ScreenTools.margins
                rightMargin: ScreenTools.margins
            }
        }
        Battery {
            id: battery
            anchors {
                right: pwrCtlButton.left
                top: parent.top
                bottom: parent.bottom
                topMargin: ScreenTools.margins
                bottomMargin: ScreenTools.margins
                rightMargin: ScreenTools.margins
            }
        }
        BracketTextButton {
            id: pwrCtlButton
            centralText.text: GlyphProvider.glyphFor("menu")
            checkable: true
            anchors {
                top:parent.top
                bottom:parent.bottom
                // verticalCenter: parent.verticalCenter
                right: parent.right
                rightMargin: ScreenTools.margins
                topMargin: ScreenTools.margins
                bottomMargin: ScreenTools.margins
            }
        }
    }

    PwrControl {
        anchor.window:topBar
        // id: pwrCtl
        visible: pwrCtlButton.checked
        anchor.rect.x:topBar.width
        anchor.rect.y:topBar.height
        onLeaved: {
            pwrCtlButton.checked = false;
        }
    }

    // CalendarView{
    //     id:calendar
    //     visible:false
    // }

    //Notifications{
    //    anchor.window:topBar
    //    anchor{
    //        rect.x:topBar.width
    //        rect.y:topBar.height + ScreenTools.margins
    //    }
    //}
    // PanelWindow{
    //     anchors{
    //         left:true
    //     }
    //     // exclusiveZone: width/2
    // }
    // PanelWindow {
    //     aboveWindows:false
    //     color:"transparent"
    //     width:120
    //     height:120
    //     anchors{
    //         left:true
    //         top:true
    //     }
    //     margins{
    //         left:200
    //         top:120
    //     }
    //     Image {
    //         id: img
    //         anchors.fill: parent
    //         source: {
    //             let players =Mpris.players
    //             for(var i=0; i< players.values.length;i++){
    //                 console.log(players.values[i].identity)
    //                 if(players.values[i].identity == "Spotify"){
    //                     return players.values[i].trackArtUrl
    //                 }
    //             }
    //         }
    //     }
    // }
}
}
