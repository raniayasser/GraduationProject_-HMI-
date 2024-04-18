import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 1.4


Window {

    visible: true
    width: 800; height: 480
    title: qsTr("main page")

    property bool callingPageVisiable: false;
    property bool debugPageVisiable: false;
    property bool gpsPageVisiable: false;
    property bool closeAlert: false;
    property bool closeLowAlert: false;

    // Fonts
    FontLoader{
        id:fontbold
        source: "qrc:/Fonts/inria-serif/InriaSerif-Bold.otf"
    }
    FontLoader{
        id:font2
        source: "qrc:/Fonts/inria-serif/InriaSerif-Regular.otf"
    }


    Rectangle{
        id:root
        width: 800;height: 480

        gradient: Gradient {
            GradientStop { position: -0.2; color: "#666666" }
            // GradientStop { position: 0.33; color: "black" }
            GradientStop { position: 1.0; color: "black" }
        }

        // ##################### {left Navbar} ###########################################
        Item {
            id:icons
            height: root.height
            anchors.margins: 20

            Image {
                id: debugIcon
                source: "qrc:/Images/settings.png"
                width:30; height: 30
                x:20; y:icons.height/5

                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        debugPageVisiable=true
                        debugMoodPage.anchors.right=root.right

                    }
                }




            }


            Image {

                id: callIcon
                source: "qrc:/Images/telephone (1).png"
                width:debugIcon.width; height: debugIcon.height
                x:20; y:icons.height/5+80

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        callingPageVisiable=true;

                        callPage.anchors.right=root.right
                    }

                }
            }

            Image {

                id: gpsIcon
                source: "qrc:/Images/pin.png"
                width:debugIcon.width; height: debugIcon.height
                x:20; y:icons.height/5+160
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        gpsPageVisiable=true;

                    }
                }
            }



            Image {

                id: massegesIcon
                source: "qrc:/Images/email.png"
                width:debugIcon.width; height: debugIcon.height
                x:20; y:icons.height/5+240
            }

        }


        // ##################### {Main Page} ###########################################

        Item {
            id: logo
            width:root.width
            height: root.height-100

            Image {
                id:carIcon
                source: "qrc:/Images/sport-car.png"
                scale:0.6
                anchors{
                    centerIn:logo


                }
                Text {
                    id:mainHeader
                    y:logo.height-50
                    text: qsTr("Driver Monitoring System
                               DMS")

                    color: "white"
                    font{
                        pixelSize: 56
                        family:idFont.name
                        // bold: true

                    }



                    anchors{
                        // bottom: (carIcon.bottom)

                        horizontalCenter: carIcon.horizontalCenter

                    }
                    FontLoader {
                        id: idFont
                        source: "qrc:/Fonts/Bungee-Inline.otf"
                    }

                }





            }

        }

    }




    // ##################### {Debug Mode Page} ###########################################

    Loader{
        id:debugMoodPage
        source:"qrc:/debugPage.qml"
        visible: debugPageVisiable
    }


    // ##################### {Calling Page} ###########################################
    Loader{
        id:callPage
        source:"qrc:/callingPage.qml"
        visible: callingPageVisiable
    }

    // ##################### {gps Level} ###########################################

    Loader{
        id:gpsPage
        source:"qrc:/gpsPage.qml"
        anchors.right: root.right
        visible: gpsPageVisiable
    }
    // ##################### {Low Risk Level} ###########################################
    Loader{
        id:lowAlertPage
        source:"qrc:/LowAlert.qml"
        anchors.fill: root
        visible: closeLowAlert;
    }


    // ##################### {High Risk Level} ###########################################

    Loader{
        id:highAlertPage
        source:"qrc:/HighAlert.qml"
        anchors.fill: root
        visible: closeAlert;
    }




}




