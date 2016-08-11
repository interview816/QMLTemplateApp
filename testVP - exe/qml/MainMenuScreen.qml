import QtQuick 2.4
import QtQuick.Controls 1.3
import QtMultimedia 5.0

import "common"


Rectangle {
    width: 1920
    height: 1080
    color: "black"

    Video {

        id: videoMainScreen
        anchors {
            top: parent.top
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }
        x: 550
        autoPlay: true

        volume: volumeValue
        readonly property real volumeValue: 0.7
        Behavior on volume {
            NumberAnimation {duration: 700}
        }

        source: "../resources/main-menu/bg-history5.wmv"

        onStopped: {
            videoMainScreen.play()
        }
    }


    ImagePushButton {
        source: "../resources/main-menu/buttons/bt_vd.png"
        id: archivebtn

        anchors {
            verticalCenter: parent.verticalCenter
        }
        x: parent.width*2.5/10

        transformOrigin: Item.Bottom
        pushScale: 0.98

        onClicked: {
            buttonSound.play();
            screensView.showScreen("videoarchive")

        }
        onVisibleChanged: {
            if(MediaPlayer.PausedState === videoMainScreen.playbackState){videoMainScreen.play();}
            else if(MediaPlayer.PlayingState === videoMainScreen.playbackState){videoMainScreen.pause();}
        }

    }

    ImagePushButton {
        source: "../resources/main-menu/buttons/bt_ph.png"
        id: gallerybtn

        anchors {
           verticalCenter: parent.verticalCenter
           left: archivebtn.right
           right: docsbtn.left
               }

        transformOrigin: Item.Bottom
        pushScale: 0.98

        onClicked: {
            //videoMainScreen.pause()
            buttonSound.play()
            screensView.showScreen("gallery")
        }
        onVisibleChanged: {
            if(MediaPlayer.PausedState === videoMainScreen.playbackState){videoMainScreen.play();}
            else if(MediaPlayer.PlayingState === videoMainScreen.playbackState){videoMainScreen.pause();}
        }

    }

    ImagePushButton {
        source: "../resources/main-menu/buttons/bt_dc.png"
        id : docsbtn

        anchors {
            verticalCenter: parent.verticalCenter
        }
        x: parent.width*5.8/10

        transformOrigin: Item.Bottom
        pushScale: 0.98

        onClicked: {
           // videoMainScreen.pause()
            buttonSound.play()
            screensView.showScreen("documents")
        }
        onVisibleChanged: {
            if(MediaPlayer.PausedState === videoMainScreen.playbackState){videoMainScreen.play();}
            else if(MediaPlayer.PlayingState === videoMainScreen.playbackState){videoMainScreen.pause();}
        }

    }

    ImagePushButton {
        source: "../resources/main-menu/buttons/logo-sam.png"

        x: 70
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 32

        onClicked: {
            buttonSound.play();
            samLogo.visible = true
        }
    }
    Contacts {
        id: samLogo
        visible: false
    }

   }



