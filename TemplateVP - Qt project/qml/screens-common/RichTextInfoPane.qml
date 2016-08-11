import QtQuick 2.4

Image {
    id: root
    property bool hasCloseButton: true
    property alias richText: textElement.text
    property alias richHeadText: textHeadElement.text
   // property alias image: imageintext.source

    signal closeClicked

    source: "../../resources/common/paper-pane.png"

    Flickable {
        id: flickablePane
        anchors.fill: parent
        anchors.margins: 100
        anchors.bottomMargin: 0
        contentWidth: textElement.width
        contentHeight: textElement.height + imageintext.height + textHeadElement.height + 40
        clip: true

        Image {
            id: imageintext;
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width - 90;
            y: textHeadElement.height + 10
            source: "../../resources/documents/9.jpg"
        }

        Text {
            id: textElement
            width: root.width - 230
            textFormat: Text.RichText
            wrapMode: Text.WordWrap
            y:imageintext.height + textHeadElement.height + 30
        }
        Text {
            id: textHeadElement
            width: root.width - 200
            textFormat: Text.RichText
            wrapMode: Text.WordWrap
            y:0
        }

    }
    ScrollBar {
        flickable: flickablePane;
    }

    CloseButton {
        anchors {
            verticalCenter: parent.top
            horizontalCenter: parent.right
            verticalCenterOffset: 40
            horizontalCenterOffset: -20
        }

        visible: hasCloseButton
        onClicked: closeClicked()
    }

    function resetViewPosition() {
        flickablePane.contentY = 0
    }
}

