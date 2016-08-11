import QtQuick 2.4
import QtQuick.Controls 1.3
import QtMultimedia 5.4

import "videoarchive"
import "gallery"
import "documents"
import "screens-common"

Item {
    focus : true
    Keys.onEscapePressed : {
        Qt.quit();
    }

    StackView {
        id: screensView
        anchors.fill: parent
        initialItem: MainMenuScreen{}

        // @TODO We could just use the predefined pushTransition and popTransition
        //       properties.
        delegate: StackViewDelegate {
            function getTransition(properties)
            {
                //return (properties.enterItem.Stack.index % 2) ? alphaTransition : scaleTransition
                return alphaTransition
            }

            function transitionFinished(properties)
            {
                properties.exitItem.opacity = 1
                properties.exitItem.scale = 1
            }

            property Component alphaTransition: StackViewTransition {
                PropertyAnimation {
                    target: enterItem
                    property: "opacity"
                    from: 0
                    to: 1
                }
                PropertyAnimation {
                    target: exitItem
                    property: "opacity"
                    from: 1
                    to: 0
                }
            }

            property Component scaleTransition: StackViewTransition {
                PropertyAnimation {
                    target: enterItem
                    property: "scale"
                    from: 0
                    to: 1
                }
                PropertyAnimation {
                    target: exitItem
                    property: "scale"
                    from: 1
                    to: 0
                }
            }
        }
    function showScreen(screenId) {
        switch(screenId) {

            case "videoarchive":    push({item: videoarchiveMainScreen}); break;
            case "videoarchive-player": push({item: videoarchivePlayer, properties: {movie:arguments[1]}}); break;

            case "gallery":     push({item: galleryMainScreen}); break;

            case "review1":      push({item: galleryScreen, properties: {model:galleryScreenModelReview1}}); break;
            case "review2":      push({item: galleryScreen, properties: {model:galleryScreenModelReview2}}); break;
            case "review3":      push({item: galleryScreen, properties: {model:galleryScreenModelReview3}}); break;
            case "review4":      push({item: galleryScreen, properties: {model:galleryScreenModelReview4}}); break;

            case "documents":    push({item: docsMainScreen}); break;

            case "doc1":         push(docsScreen1); break;
            case "doc2":         push(docsScreen2); break;
            case "doc3":         push(docsScreen3); break;
            case "doc4":         push(docsScreen4); break;
          }
    }

    function backOneScreen() {
        pop()
    }
    }


    /*------------------------------------------------------------*/

    ////////////////////////////////////////////////////////////////
    // <<<<< VIDEOARCHIVE SCREENS                                 //
    ////////////////////////////////////////////////////////////////
        VideoarchiveModel { // Declared here to load at startup
            id: videoarchiveModel
        }

        Component {
            id: videoarchiveMainScreen
            Videoarchive {}
        }

        Component {
            id: videoarchivePlayer
            VideoarchivePlayer {
                Stack.onStatusChanged: {
                    if(Stack.Activating == Stack.status) {
                    } else if(Stack.Deactivating == Stack.status) {

                    }
                }
            }
        }

    ////////////////////////////////////////////////////////////////
    // >>>>> VIDEOARCHIVE SCREENS                                 //
    ////////////////////////////////////////////////////////////////

        /*------------------------------------------------------------*/

        ////////////////////////////////////////////////////////////////
        // <<<<< GALLERY SCREENS                                 //
        ////////////////////////////////////////////////////////////////

        GalleryScreenModelReview1{
            id: galleryScreenModelReview1
        }
        GalleryScreenModelReview2{
            id: galleryScreenModelReview2
        }
        GalleryScreenModelReview3{
            id: galleryScreenModelReview3
        }
        GalleryScreenModelReview4{
            id: galleryScreenModelReview4
        }


        GalleryModel {
            id: galleryModel
        }
        Component {
            id: galleryMainScreen
            Gallery {}
        }
            Component {
                id: galleryScreen
                GalleryScreen {
                    Stack.onStatusChanged: {
                        if(Stack.Activating == Stack.status) {
                            //logoMuseum.hide();

                        } else if(Stack.Deactivating == Stack.status) {
                            //logoMuseum.show();

                        }
                    }
                }
            }

            ////////////////////////////////////////////////////////////////
            // <<<<< GALLERY SCREENS                                 //
            ////////////////////////////////////////////////////////////////

            ////////////////////////////////////////////////////////////////
            // <<<<< DOCUMENTS SCREENS                                 //
            ////////////////////////////////////////////////////////////////


                    DocsModel {
                        id: docsModel
                    }
                    Component {
                        id: docsMainScreen
                        Docs {}
                    }

                    Component {
                        id: docsScreen1
                        DocsScreen1 {}
                    }
                    Component {
                        id: docsScreen2
                        DocsScreen2 {}
                    }
                    Component {
                        id: docsScreen3
                        DocsScreen3 {}
                    }
                    Component {
                        id: docsScreen4
                        DocsScreen4 {}
                    }

        /*------------------------------------------------------------*/


        SoundEffect {
            id: buttonSound
            source: "../resources/sounds/button.wav"
        }

        SoundEffect {
            id: closeSound
            source: "../resources/sounds/close-sound.wav"
        }
        SoundEffect {
            id: navigationSound
            source: "../resources/sounds/navigation-sound.wav"
        }



}


