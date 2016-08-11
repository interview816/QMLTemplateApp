import QtQuick 2.4

import "../common"

ImagePushButton {
    source: "../../resources/common/navigate-right-btn.png"
    pushScale: 0.8

    onClicked: {
        navigationSound.play()
    }
}

