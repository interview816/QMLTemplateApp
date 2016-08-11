import QtQuick 2.4
import QtQuick.Controls 1.3

import "../common"
import "../screens-common"

Item {
    id: root
    readonly property real navigateButtonsMargin: 40

    GalleryBackgroundPhotosModel {
        id: underdecorModel
    }

    BackgroundImage {
        id: underdecor1

        onStatusChanged: {
            if (status == Image.Ready) {
                activate()
            }
        }

        function activate() {
            state = "SHOWN"
        }
    }

    BackgroundImage {
        id: underdecor2

        onStatusChanged: {
            if (status == Image.Ready) {
                activate()
            }
        }

        function activate() {
            state = "SHOWN"
            underdecor1.state = "HIDDEN"
        }
    }

    Timer {
        id: underdecorTimer
        property bool flag: false
        property int currentIndex: -1

        interval: 7500
        repeat: true
        triggeredOnStart: true

        onTriggered: {
            var newIndex = Math.floor(Math.random() * underdecorModel.count)
            if(newIndex == underdecorTimer.currentIndex) {
                newIndex++
                if(newIndex == underdecorModel.count) {
                    newIndex = 0
                }
            }
            underdecorTimer.currentIndex = newIndex
            if(!underdecorTimer.flag) {
                underdecor1.source = underdecorModel.get(underdecorTimer.currentIndex).img
                // It seems that under some circumstances image could be get from the
                // cache and in this case it loaded "instantly" and onStatusChanged()
                // for BackgroundImage object will not be called, so we have to
                // perform the action immediately
                if(Image.Ready == underdecor1.status) {
                    underdecor1.activate()
                }
            } else {
                underdecor2.source = underdecorModel.get(underdecorTimer.currentIndex).img
                // It seems that under some circumstances image could be get from the
                // cache and in this case it loaded "instantly" and onStatusChanged()
                // for BackgroundImage object will not be called, so we have to
                // perform the action immediately
                if(Image.Ready == underdecor2.status) {
                    underdecor2.activate()
                }
            }

            underdecorTimer.flag = !underdecorTimer.flag
        }
    }

    Stack.onStatusChanged: {
        if(Stack.Activating === Stack.status) {
            underdecorTimer.start()
        } else if(Stack.Deactivating === Stack.status) {
            underdecorTimer.stop()
        }
    }

    ListView {
        id: galleryPagesListView
        anchors.fill: parent

        orientation: ListView.Horizontal
        snapMode: ListView.SnapOneItem
        highlightRangeMode: ListView.StrictlyEnforceRange
        highlightMoveDuration: 300

        model: galleryModel
        delegate: Item {
            width: root.width
            height: root.height

            Repeater {
                model: movies
                delegate: Item {
                    id: itemRoot
                    x: centerX
                    y: centerY

                    Image {
                        id: itemBorderImage
                        source: "../../resources/videoarchive/main-screen/item-border.png"

                        anchors.centerIn: parent

                        Image {
                            source: thumbnail
                            asynchronous: true
                            x: 68
                            y: 55
                        }
                    }

                    Image {
                        id: itemTitlePane
                        source: "../../resources/videoarchive/main-screen/item-title-pane.png"

                        anchors {
                            horizontalCenter: itemBorderImage.horizontalCenter
                            top: itemBorderImage.bottom
                            topMargin: -40
                        }

                        Text {
                            anchors.centerIn: parent

                            font {
                                family: "Minion Pro"
                                pointSize: 20
                            }

                            horizontalAlignment: Text.AlignHCenter
                            color: "white"

                            text: title
                        }
                    }

                    PushButtonMouseArea {
                        buttonItem: itemRoot
                        pushScale: 0.98

                        anchors {
                            top: itemBorderImage.top
                            bottom: itemTitlePane.bottom
                            left: itemBorderImage.left
                            right: itemBorderImage.right
                        }

                        /* Debug rect
                        Rectangle {
                            color: "red"
                            opacity: 0.4
                            anchors.fill: parent
                        }
                        */

                        onClicked: {
                            buttonSound.play()
                            screensView.showScreen(scrId)
                        }
                    }
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

        visible: galleryPagesListView.currentIndex > 0

        onClicked: galleryPagesListView.decrementCurrentIndex()
    }

    NavigateRightButton {
        anchors {
            right: parent.right
            verticalCenter: parent.verticalCenter
            rightMargin: navigateButtonsMargin
        }

        visible: galleryPagesListView.currentIndex < (galleryPagesListView.count - 1)

        onClicked: galleryPagesListView.incrementCurrentIndex()
    }

    // Should be last element to have greater Z order than other screen elements
    ImagePushButton {
        // Unfortunately there is no good anchor objects, so forced to use absolute positions
        x: 110
        y: 210
        source: "../../resources/videoarchive/main-screen/back-btn.png"

        onClicked: {
            closeSound.play()
            screensView.backOneScreen()

        }
    }
}

