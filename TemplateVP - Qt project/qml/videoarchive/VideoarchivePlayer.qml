import QtQuick 2.4
import QtMultimedia 5.4

import "../screens-common"
import "../screens-common/videoplayer"

Rectangle {
    width: 1920
    height: 1080
    color: "black"

    property string movie

    Video {
        id: videoPlayer
        anchors {
            top: parent.top
            bottom: playerControlBar.top
            left: parent.left
            right: parent.right
        }

        source: movie
        autoPlay: true

        function setVolume(nonNormalizedVolume) {
            volume = Math.max(Math.min(nonNormalizedVolume, 1), 0)
        }

        onPositionChanged: {
            playerControlBar.playbackSeconds = Math.floor(position / 1000)
        }

        onStopped: {
            screensView.backOneScreen()
        }
    }

    VideoPlayerControlBar {
        id: playerControlBar
        anchors {
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }
    }

    CloseButton {
        anchors {
            top: parent.top
            right: parent.right
            topMargin: 20
            rightMargin: 20
        }

        onClicked: {
            // This will also cause return to previous screen via the onStopped() handler
            // of Video object
            videoPlayer.stop()
        }
    }
}

