import QtQuick 2.4
import "common"

Item {
    id: root
    anchors.fill: parent

    PopupBack {}

    Image {
        source: "../resources/main-menu/contacts/contact-page-popup.png"

        anchors.centerIn: parent

        ImagePushButton {
            source: "../resources/main-menu/contacts/close-btn.png"
            anchors.centerIn: parent
            anchors.horizontalCenterOffset: 625
            anchors.verticalCenterOffset: -225
            onClicked: {
                buttonSound.play()
                root.visible = false
            }
        }
    }

    states: [
        State {
            name: "HIDE"
            when: root.visible == false
            PropertyChanges { target: root; opacity: 0.0}
        },

        State {
            name: "SHOW"
            when: root.visible == true
            PropertyChanges { target: root; opacity: 1.0}
        }
    ]

    transitions: [
        Transition {
            from: "HIDE"
            to: "SHOW"

            SequentialAnimation {
                PauseAnimation  {duration: 100}
                NumberAnimation {properties: "opacity"; duration: 200}
            }
        }
    ]
}
