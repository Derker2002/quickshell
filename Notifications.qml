import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Notifications

PopupWindow {
    visible: true
    // color: '#305070'
    color:'transparent'
    implicitWidth: 350
    implicitHeight: 1080 - anchor.rect.y - ScreenTools.margins * 2
    property bool isDebug: true
    NotificationServer{
        id: notificationServer
        onNotification: (notification)=>{
            notificationsList.append({"notification":notification})
        }
    }

    ListModel {
        id: notificationsList
    }

    ListView {
        id: list
        spacing: ScreenTools.spacings
        anchors.fill: parent
        Repeater {
            model: notificationsList
            delegate: Rectangle{
                required property var notification
                Layout.fillWidth: true
                height: body.implicitHeight
                color: "gray"
                radius: ScreenTools.radius
                ColumnLayout{
                    id: body
                    RowLayout {
                    Layout.margins: ScreenTools.margins

                        Text{
                            text: notification.summary
                        }
                    }
                    Text{
                        Layout.margins: ScreenTools.margins
                        visible: isDebug
                        text: JSON.stringify(notification).replace(/,/g,'\n')
                    }
                }
            }
        }
        Item{
            Layout.fillHeight:true
        }
    }
  }


