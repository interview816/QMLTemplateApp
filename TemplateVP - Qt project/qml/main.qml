import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    id: appWindow
    title: qsTr("VideoPlayer")
    visibility: "FullScreen"   // Set application to fullscreen mode
    visible: true              // Not actually required in fullscreen, but better to keep here for a debug in windowed mode

    color: "#000000"

    AppView {
        anchors.fill: parent;
    }
}
