import QtQuick 2.4
import "../common"

ImagePushButton {
    id: root

    QtObject {  // For private properties, according to QML coding convention
        id: p
        property bool mutedForVideo: false
    }

    property bool mute: false

    source: "../../resources/common/sound-btn.png"
    transformOrigin: Item.Center
    pushScale: 0.9

    // @TODO Visual states for On/Off ?
    opacity: mute ? 0.7 : 1.0

    onClicked: {
        mute = !mute
    }

    function muteForVideo() {
        if(!mute) {
            mute = true
            p.mutedForVideo = true
        }
        visible = false
    }

    function unmuteAfterVideo() {
        if(p.mutedForVideo) {
            p.mutedForVideo = false
            mute = false
        }
        visible = true
    }
}
