import QtQuick.Layouts
import QtQuick
import Quickshell
import Quickshell.Services.Mpris

Rectangle {
    color: "transparent"
    radius: ScreenTools.radius / 2

    implicitWidth: rootRow.implicitWidth
    implicitHeight: rootRow.implicitHeight
    RowLayout {
        id: rootRow
        anchors.fill: parent
        // spacing: ScreenTools.spacing
        property MprisPlayer selectedPlayer: null

        RowLayout {
            visible: rootRow.selectedPlayer != null && rootRow.selectedPlayer.canControl
            Layout.leftMargin: ScreenTools.margins
            Layout.rightMargin: ScreenTools.margins

            Item {
                id: titleContainer
                Layout.maximumWidth: 200
                Layout.preferredWidth: text1.implicitWidth > Layout.maximumWidth ? Layout.maximumWidth : text1.implicitWidth
                Layout.fillHeight: true
                Layout.alignment: Qt.AlignVCenter
                clip: true

                property bool overflow: text1.implicitWidth > width
                property int scrollDistance: text1.implicitWidth + 50

                Row {
                    id: marqueeRow
                    spacing: 50
                    anchors.verticalCenter: parent.verticalCenter
                    Text {
                        id: text1
                        anchors.verticalCenter: parent.verticalCenter
                        text: rootRow.selectedPlayer ? rootRow.selectedPlayer.trackTitle + " - by - " + rootRow.selectedPlayer.trackArtist : "?"
                        color: MyPalette.text
                        onTextChanged: {
                            marqueeRow.x = 0;
                        }
                    }

                    Text {
                        text: text1.text
                        color: MyPalette.text
                    }
                }

                NumberAnimation {
                    id: scrollAnim
                    target: marqueeRow
                    property: "x"
                    from: 0
                    to: -titleContainer.scrollDistance
                    duration: 6000
                    loops: Animation.Infinite
                    easing.type: Easing.Linear
                    running: titleContainer.overflow
                }
            }

            BracketTextButton {
                centralText.text: rootRow.selectedPlayer ? GlyphProvider.glyphFor(rootRow.selectedPlayer.identity) : "?"
                onClicked: {
                    rootRow.selectedPlayer = null;
                }
            }

            BracketTextButton {
                property var player: rootRow.selectedPlayer
                centralText.text: GlyphProvider.glyphFor("backward")
                onClicked: player.previous()
            }
            BracketTextButton {
                id: playBtn
                property var player: rootRow.selectedPlayer
                centralText.text: playBtn.player ?  GlyphProvider.glyphFor(playBtn.player.playbackState == MprisPlaybackState.Playing ? "pause" : "play") : "?"
                onClicked: {
                    player.togglePlaying();
                }
            }
            BracketTextButton {
                property var player: rootRow.selectedPlayer
                centralText.text: GlyphProvider.glyphFor("forward")
                onClicked: player.next()
            }
        }

        Repeater {
            model: Mpris.players
            delegate: BracketTextButton {
                required property MprisPlayer modelData
                Layout.alignment: Qt.AlignVCenter
                // defaultBracketColor: "transparent"
                // hoverBracketColor: "transparent"
                visible: rootRow.selectedPlayer != modelData
                centralText.text: GlyphProvider.glyphFor(modelData.identity)
                onClicked: {
                    // enabled = false;
                    rootRow.selectedPlayer = modelData;
                }
            }
        }
    }
}
