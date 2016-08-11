import QtQuick 2.4

import "../common"

ImagePushButton {
    source: "../../resources/common/close-btn.png"

    onClicked: {
        closeSound.play()
    }
}

