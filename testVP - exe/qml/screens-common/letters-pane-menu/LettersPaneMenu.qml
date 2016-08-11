import QtQuick 2.4

import ".."
import "../../common"

Item {
    property alias model: menuItemsRepeater.model
    property int elemId: 0 // for states in animation

    signal itemClicked(int index, string actionId)

    anchors.verticalCenter: parent.verticalCenter
    anchors.right: parent.right
    anchors.rightMargin: 235

    width: 1200
    height: 700

    Repeater{
        id: menuItemsRepeater
        anchors.fill: parent

        delegate: Item {

            id: btnRoot
            anchors.fill: parent
            visible: scale > 0.8


                PushButton{

                    id: bigButton
                    anchors.centerIn: parent
                    width: 1000
                    height: 700
                    pushScale: 0.98
                    //*********letter image******************
                    Image {
                        id: root
                        source: "../../../resources/common/letters-pane.png"
                        anchors.centerIn: parent

                        signal clicked

                        onClicked: itemClicked(index, actionId)

                        states: [
                            State {
                                name: "HIDE"
                                when: elemId != index
                                PropertyChanges { target: root; scale: 0.3; opacity: 0.0}
                            },

                            State {
                                name: "SHOW"
                                when: elemId == index
                                PropertyChanges { target: root; scale: 1.0; opacity: 1.0}
                            }
                        ]

                        transitions: [
                            Transition {
                                from: "HIDE"
                                to: "SHOW"

                                SequentialAnimation{
                                    PauseAnimation  {duration: 100}
                                    NumberAnimation {properties: "scale, opacity"; easing.type: Easing.OutBack; duration: 300}
                                }
                            },

                            Transition {
                                from: "SHOW"
                                to: "HIDE"

                                NumberAnimation {properties: "scale, opacity"; easing.type: Easing.OutBack; duration: 500}
                            }
                        ]
                    }

                    //************end letter image*****************


                    //************decor 2 image*******************

                    Image {
                        id: decor2
                        anchors {
                            id: anchorsImg2
                            centerIn: parent
                            verticalCenterOffset: decor2VCenterOffset
                            horizontalCenterOffset: decor2HCenterOffset
                        }
                        source: "../../../resources/" + resPrefix + "/menu-decor-2." + decor2Ext
                        rotation: decor2Rotation
                        scale: decor2Scale

                        states: [
                            State {
                                name: "HIDE"
                                when: elemId != index
                                PropertyChanges { target: decor2; scale: 0.5; rotation: decor2Rotation + 50; opacity: 0.0}
                            },

                            State {
                                name: "SHOW"
                               when: elemId == index
                                PropertyChanges { target: decor2; scale: 1.0; rotation: decor2Rotation; opacity: 1.0}
                            }
                        ]
                        transitions: [
                            Transition {
                                from: "HIDE"
                                to: "SHOW"

                                NumberAnimation {properties: "scale, rotation, opacity"; easing.type: Easing.InOutBack; duration: 800}
                            },

                            Transition {
                                from: "SHOW"
                                to: "HIDE"

                                NumberAnimation {properties: "scale, rotation, opacity"; easing.type: Easing.InOutBack; duration: 800}
                            }
                        ]
                    }
                    //***********************end decor 2 image************************


                    //***********************decor 1 image***************************
                    Image {
                        id: decor1
                        anchors {
                            id: anchorsImg1
                            centerIn: parent
                            verticalCenterOffset: decor1VCenterOffset
                            horizontalCenterOffset: decor1HCenterOffset
                        }
                        source: "../../../resources/" + resPrefix + "/menu-decor-1." + decor1Ext
                        rotation: decor1Rotation
                        scale: decor1Scale

                        states: [
                            State {
                                name: "HIDE"
                                when: elemId != index
                                PropertyChanges { target: decor1; scale: 0.5; rotation: decor1Rotation + 50; opacity: 0.0}
                            },

                            State {
                                name: "SHOW"
                                when: elemId == index
                                PropertyChanges { target: decor1; scale: 1.0; rotation: decor1Rotation; opacity: 1.0}
                            }
                        ]
                        transitions: [
                            Transition {
                                from: "HIDE"
                                to: "SHOW"

                                NumberAnimation {properties: "scale, rotation, opacity"; easing.type: Easing.InOutBack; duration: 800}
                            },

                            Transition {
                                from: "SHOW"
                                to: "HIDE"

                                NumberAnimation {properties: "scale, rotation, opacity"; easing.type: Easing.InOutBack; duration: 800}
                            }
                        ]
                    }

                    //**********************end decor 1 image**************************


                    //*********************image with text****************************
                    Rectangle {
                        anchors.centerIn: itemText
                        width: itemText.width - 10
                        height: itemText.height - 11
                        color: "#c1c192"
                        scale: itemText.scale
                    }

                    Image {
                        id: itemText
                        source: "../../../resources/" + resPrefix + "/btn-pad.png"
                        anchors {
                            centerIn: parent
                            verticalCenterOffset: btnVCenterOffset
                            horizontalCenterOffset: btnHCenterOffset
                        }



                        Text {
                            font.family: "Open Sans Condensed"
                            font.pointSize: 32
                            color: "#a02511"
                            anchors.centerIn: itemText
                            text: btnTitle
                        }


                        states: [
                            State {
                                name: "HIDE"
                                when: elemId != index
                                PropertyChanges { target: itemText; scale: 0.3; opacity: 0.0}
                            },

                            State {
                                name: "SHOW"
                                when: elemId == index
                                PropertyChanges { target: itemText; scale: 1.0; opacity: 1.0}
                            }
                        ]

                        transitions: [
                            Transition {
                                from: "HIDE"
                                to: "SHOW"

                                SequentialAnimation{
                                    PauseAnimation  {duration: 300}
                                    NumberAnimation {properties: "scale, opacity"; easing.type: Easing.OutBack; duration: 300}
                                }
                            },

                            Transition {
                                from: "SHOW"
                                to: "HIDE"

                                NumberAnimation {properties: "scale, opacity"; easing.type: Easing.OutBack; duration: 300}
                            }
                        ]

                    }

                    //*********************end image with text****************************

                    onClicked: {
                        buttonSound.play()
                        root.clicked()
                    }

                }

                //*************end PushButton********************************************

                    states: [
                        State {
                            name: "HIDE"
                            when: elemId != index
                            PropertyChanges { target: btnRoot; scale: 0.8; opacity: 0.0}
                        },

                        State {
                            name: "SHOW"
                            when: elemId == index
                            PropertyChanges { target: btnRoot; scale: 1.0; opacity: 1.0}
                        }
                    ]

                    transitions: [
                        Transition {
                            from: "HIDE"
                            to: "SHOW"

                            SequentialAnimation{
                                PauseAnimation  {duration: 300}
                                NumberAnimation {properties: "scale, opacity"; easing.type: Easing.OutBack; duration: 300}
                            }
                        },

                        Transition {
                            from: "SHOW"
                            to: "HIDE"

                            NumberAnimation {properties: "scale, opacity"; easing.type: Easing.OutBack; duration: 300}
                        }
                    ]

                }
    }



    NavigateRightButton {
        anchors.right: parent.right
        anchors.rightMargin: -10
        anchors.verticalCenter: parent.verticalCenter

        visible: menuItemsRepeater.count > 1

        onClicked: {
            elemId = (menuItemsRepeater.count - 1 == elemId) ? 0 : elemId + 1
        }
    }

    NavigateLeftButton {
        anchors.left: parent.left
        anchors.leftMargin: -5
        anchors.verticalCenter: parent.verticalCenter

        visible: menuItemsRepeater.count > 1

        onClicked: {
            elemId = (elemId == 0) ? menuItemsRepeater.count - 1 : elemId - 1
        }
    }
}
