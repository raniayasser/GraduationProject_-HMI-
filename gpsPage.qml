import QtQuick 2.15

Item {
width:730; height:480
Image {
    id: gps
    source: "qrc:/Images/GPS.webp"
    // width:730; height:480
    anchors.fill:parent
    anchors.centerIn: parent
    Image {
        id: closeIcon
        width:30;height:30;
        source: "qrc:/Images/close.png"
        anchors{
            top: gps.top
            right: gps.right
            margins: 5

        }
        MouseArea{
            anchors.fill: parent
        onClicked: {
        gpsPageVisiable=false;
        }}
    }
}
}
