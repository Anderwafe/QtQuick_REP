import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15

Rectangle{
    property alias headerText: headerText.text
    height: 35
    color: "#e6e3e3"
    Layout.fillWidth: true
    Label{
        id: headerText
        anchors.verticalCenter: parent.verticalCenter
        x: 10
        font.pointSize: 13
        font.bold: true
    }
}

