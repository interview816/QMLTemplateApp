import QtQuick 2.4

Image {
    id: root

    property int transitionDuration: 900

    visible: opacity > 0.1
    asynchronous: true

    state: "HIDDEN"

    states: [
        State {
            name: "HIDDEN"
            PropertyChanges { target: root; opacity: 0.0}
        },

        State {
            name: "SHOWN"
            PropertyChanges { target: root; opacity: 1.0}
        }
    ]

    transitions: [
        Transition {
            from: "HIDDEN"
            to: "SHOWN"
            NumberAnimation {properties: "opacity"; duration: root.transitionDuration}
        },

        Transition {
            from: "SHOWN"
            to: "HIDDEN"
            NumberAnimation {properties: "opacity"; duration: root.transitionDuration}
        }
    ]
}
