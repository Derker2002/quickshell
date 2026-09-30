import QtQuick
import Quickshell
import Quickshell.Services.Pipewire
import QtQuick.Layouts

BracketButton {
    id: button
    property var audioInfo: Pipewire.defaultAudioSink ? Pipewire.defaultAudioSink : null
    property bool isBluetooth: audioInfo.name.includes("bluez")
    property bool isMuted:audioInfo.audio.muted
    property alias showPercentage: percentage.visible
    property alias showIndicator: indicator.visible

    PwObjectTracker {
        objects: [audioInfo]
    }

    centerItem: RowLayout {
        id: rowLayout
        spacing: ScreenTools.spacings
        Text {
            id:percentage
            text: {
                let volume = Math.round(audioInfo.audio.volume * 100);
                return volume+"%"
                }
            Layout.leftMargin: ScreenTools.margins
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
        }

        Text {
            id:indicator
            text: {
                if (isMuted) {
                    if(isBluetooth){
                        return GlyphProvider.glyphFor("headphones_off");
                    }
                    return GlyphProvider.glyphFor("volume_off");
                } 
                if (isBluetooth) {
                    return GlyphProvider.glyphFor("headphones")
                }
                return GlyphProvider.glyphFor("volume_" + Math.ceil(audioInfo.audio.volume * 2));
            }
            color: {
                if (isMuted) {
                    return MyPalette.red;
                }
                MyPalette.text;
            }
            Layout.alignment:Qt.AlignVCenter | Qt.AlignLeft
        }
    }
    onClicked: {
        audioInfo.audio.muted = !audioInfo.audio.muted;
    }
    onWheel: wheel => {
        if (wheel.angleDelta.y > 0) {
            let volume = audioInfo.audio.volume;
            audioInfo.audio.volume = Math.min(1, volume + 0.005);
        }
        if (wheel.angleDelta.y < 0) {
            let volume = audioInfo.audio.volume;
            audioInfo.audio.volume = Math.max(0, volume - 0.005);
        }
    }
}
