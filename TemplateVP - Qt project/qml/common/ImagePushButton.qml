import QtQuick 2.4

Image {
    id: root

    property real pushScale: 0.9
    property int pushMargins: 10

    signal clicked

    scale: mousePushArea.pressed ? pushScale : 1.0

    MouseArea {
        id: mousePushArea
        anchors.fill: parent
        anchors.margins: -root.pushMargins
        onClicked: root.clicked()
    }
}
