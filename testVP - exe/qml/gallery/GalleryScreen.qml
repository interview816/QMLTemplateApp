import QtQuick 2.4

import "../screens-common"

Image {
    id: root

    property alias model: galleryListView.model
    readonly property real navigateButtonsMargin: 40
    readonly property real titlePaneActiveZoneWidth: 400

    source: "../../resources/backgrounds/bg4.jpg"

    ListView {
        id: galleryListView
        anchors.fill: parent

        orientation: ListView.Horizontal
        snapMode: ListView.SnapOneItem
        highlightRangeMode: ListView.StrictlyEnforceRange
        highlightMoveDuration: 300

        delegate: Item {
            width: root.width
            height: root.height

            property real halfWidth: width / 2
            property real centerViewDeltaNormalized: Math.abs(x - galleryListView.contentX) / titlePaneActiveZoneWidth
            property real centerViewDeltaNormalizedClamped: Math.min(Math.max(centerViewDeltaNormalized, 0), 1)

            Image {
                source: img
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter

                //@TODO Show simple "Loading" animation instead of image during image loading ?
                asynchronous: true // To make UI responsive
            }
            Rectangle {

                anchors {
                    bottom: parent.bottom
                    bottomMargin: -height * centerViewDeltaNormalizedClamped
                    horizontalCenter: parent.horizontalCenter
                }

                Text {
                    anchors {
                        fill: parent
                        topMargin: 0
                        leftMargin: 45
                        rightMargin: 45
                        bottomMargin: 60
                    }

                    font {
                        family: "Open Sans Condensed"
                        pointSize: 16
                        capitalization: Font.AllUppercase
                    }

                    color: "white"
                    text: title

                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.WordWrap
                }
            }

        }
    }

    NavigateLeftButton {
        anchors {
            left: parent.left
            verticalCenter: parent.verticalCenter
            leftMargin: navigateButtonsMargin
        }

        visible: galleryListView.currentIndex > 0

        onClicked: galleryListView.decrementCurrentIndex()
    }

    NavigateRightButton {
        anchors {
            right: parent.right
            verticalCenter: parent.verticalCenter
            rightMargin: navigateButtonsMargin
        }

        visible: galleryListView.currentIndex < (galleryListView.count - 1)

        onClicked: galleryListView.incrementCurrentIndex()
    }

    CloseButton {
        anchors {
            top: parent.top
            right: parent.right
            topMargin: 20
            rightMargin: 20
        }

        onClicked: {
            screensView.backOneScreen()
        }
    }
}
