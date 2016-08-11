import QtQuick 2.4
import "../common"

ImagePushButton {
    source: "../../resources/common/home-btn.png"
    anchors.left: parent.left
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 30
    transformOrigin: Item.Left
    pushScale: 0.98

    onClicked: {
        closeSound.play()
        screensView.backOneScreen()
    }
}

