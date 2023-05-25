import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15

Rectangle{
    property alias mainText: mainText.text
    property alias descText: descText.text
    height: 20
    Layout.fillWidth: true
    RowLayout{
        Rectangle{
            height: 20
            width: 250
            Label{id: mainText}
        }
        Label{id: descText; Layout.fillWidth: true}
    }
}
