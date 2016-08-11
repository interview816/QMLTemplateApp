import QtQuick 2.4
import QtMultimedia 5.4

import "../../common"

Item {
    property alias playbackSeconds: currentPlaybackTime.playbackSeconds

    height: 80

    Rectangle {
        anchors.fill: parent
        color: "black"
        opacity: 0.7
    }

    Item {
        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
            leftMargin: 40
        }
        ImagePushButton {
            source: "../../../resources/common/play-btn.png"
            anchors.centerIn: parent
            visible: MediaPlayer.StoppedState === videoPlayer.playbackState || MediaPlayer.PausedState === videoPlayer.playbackState
            onClicked: videoPlayer.play()
        }
        ImagePushButton {
            source: "../../../resources/common/pause-btn.png"
            anchors.centerIn: parent
            visible: MediaPlayer.PlayingState === videoPlayer.playbackState
            onClicked: videoPlayer.pause()
        }
    }

    Rectangle {
        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
            leftMargin: 80
            right: volumeIcon.left
            rightMargin: 10
        }
        height: 40
        color: "#292929"

        Rectangle {
            id: positionMarker
            height: parent.height
            width: 4
            x: (videoPlayer.position / videoPlayer.duration) * (parent.width - width)
            color: "#008D3A"
        }

        Text {
            id: currentPlaybackTime

            property int playbackSeconds: 0

            anchors.verticalCenter: parent.verticalCenter
            x: positionMarker.x < (parent.width / 2) ? (positionMarker.x + positionMarker.width + 4) : (positionMarker.x - width - 4)

            font.pixelSize: 20
            color: "#008D3A"

            onPlaybackSecondsChanged: {
                updateString()
            }

            function updateString() {
                var time = playbackSeconds
                var seconds = time % 60
                time = Math.floor(time / 60)
                var minutes = time % 60
                time = Math.floor(time / 60)
                var hours = time % 24

                var str
                var strSeconds = (seconds < 10 ? "0%1" : "%1").arg(seconds)
                if(hours > 0) {
                    var strMinutes = (minutes < 10 ? "0%1" : "%1" ).arg(minutes)
                    str = "%1:%2:%3".arg(hours).arg(strMinutes).arg(strSeconds)
                } else {
                    str = "%1:%2".arg(minutes).arg(strSeconds)
                }
                text = str
            }

            Component.onCompleted: updateString()
        }

        MouseArea {
            anchors.fill: parent
            onPressed: {
                var normalizedPosition = mouse.x / width
                videoPlayer.seek(videoPlayer.duration * normalizedPosition)
            }
        }
    }

    Image {
        id: volumeIcon
        source: "../../../resources/common/volume-icon.png"
        anchors {
            verticalCenter: parent.verticalCenter
            right: volumeDecBtn.left
            rightMargin: 10
        }
    }

    ImagePushButton {
        id: volumeDecBtn
        source: "../../../resources/common/volume-dec-btn.png"

        anchors {
            verticalCenter: parent.verticalCenter
            right: volumeBarItem.left
            rightMargin: 10
        }

        onClicked: {
            videoPlayer.setVolume(videoPlayer.volume - 0.15)
        }
    }

    Item {
        id: volumeBarItem
        width: volumeBar.width
        height: volumeBar.height

        anchors {
            verticalCenter: parent.verticalCenter
            right: volumeIncBtn.left
            rightMargin: 10
        }

        Row {
            id: volumeBar

            spacing: 3

            Repeater {
                id: volumeBarRepeater
                model: 10
                Rectangle {
                    height: 40
                    width: 4
                    color: videoPlayer.volume > (x / volumeBar.width) ? "white" : "grey"
                }
            }
        }

        MouseArea {
            anchors.fill: volumeBar

            onPressed: setVolume()
            onPositionChanged: setVolume()

            function setVolume() {
                videoPlayer.setVolume(mouseX / width)
            }
        }
    }

    ImagePushButton {
        id: volumeIncBtn
        source: "../../../resources/common/volume-inc-btn.png"

        anchors {
            verticalCenter: parent.verticalCenter
            right: parent.right
            rightMargin: 10
        }

        onClicked: {
            videoPlayer.setVolume(videoPlayer.volume + 0.15)
        }
    }
}
