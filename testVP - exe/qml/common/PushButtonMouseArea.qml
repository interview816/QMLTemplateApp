import QtQuick 2.4

MouseArea {
    id: mousePushArea

    property Item buttonItem: null
    property real pushScale: 0.9

    onPressed: {
        if(null !== buttonItem) {
            buttonItem.scale = pushScale
        }
    }

    onReleased: {
        if(null !== buttonItem) {
            buttonItem.scale = 1.0
        }
    }

    onCanceled: {
        if(null !== buttonItem) {
            buttonItem.scale = 1.0
        }
    }
}
