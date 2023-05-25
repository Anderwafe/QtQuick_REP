import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import com.lab3.switcher 1.0
import QtQuick.Window 2.15
import QtQuick.Dialogs
import com.release8.ProcessorInfo 1.0
import com.release8.DevicesInfo 1.0
import com.release8.RAMInfo 1.0
import com.release8.DmesgInfo 1.0


ApplicationWindow {
    objectName: "MainWindow"
    width: maximumWidth
    height: maximumHeight
    visible: true
    title: qsTr("Hello World")

    property int cpuInfo: 5

    color: "#" + ( Math.floor(slider1.value).toString(16).length == 2 ? Math.floor(slider1.value).toString(16) : "0" + Math.floor(slider1.value).toString(16)) + ( Math.floor(slider2.value).toString(16).length == 2 ? Math.floor(slider2.value).toString(16) : "0" + Math.floor(slider2.value).toString(16)) + ( Math.floor(slider3.value).toString(16).length == 2 ? Math.floor(slider3.value).toString(16) : "0" + Math.floor(slider3.value).toString(16))

    TabBar
    {
        id: tabbar
        width: parent.width
        //position: verticalCenter

        TabButton
        {
            font.pointSize: fontPointSize.value
            text: qsTr("Меню")
            width: 150
        }
        TabButton
        {
            font.pointSize: fontPointSize.value
            text: qsTr("Персонализация")
            width: 200
        }
        TabButton
        {
            font.pointSize: fontPointSize.value
            text: qsTr("Буфер ядра")
            width: 200
        }
        TabButton
        {
            font.pointSize: fontPointSize.value
            text: qsTr("ЦП")
            width: 100
        }
        TabButton
        {
            font.pointSize: fontPointSize.value
            text: qsTr("Подключенные устройства")
            width: 300
        }
        TabButton
        {
            font.pointSize: fontPointSize.value
            text: qsTr("ОЗУ")
            width: 100
        }
        TabButton
        {
            font.pointSize: fontPointSize.value
            text: qsTr("Клавиатура")
            width: 150
        }
        TabButton
        {
            font.pointSize: fontPointSize.value
            text: qsTr("Проектор")
            width: 150
        }
        TabButton
        {
            font.pointSize: fontPointSize.value
            text: qsTr("Устройство «Модуль 40»")
            width: 300
        }
    }

    StackLayout
    {
        id: stacklayout
        height: parent.height - tabbar.height
        width: parent.width
        anchors.top: tabbar.bottom
        currentIndex: tabbar.currentIndex
        Item{
            Rectangle{
                //width: parent.width-600
                //height: parent.height-600
                width: label111.width + 100
                height: label111.height + 100
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                color: "#e6e3e3"
                border.color: "#000000"
                radius: 25
                Label
                {
                    id: label111
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter

                    horizontalAlignment: "AlignHCenter"
                    font.pointSize: fontPointSize.value
                    text: "Добро пожаловать! Данное приложение является сборником из 8 программ,
выполняющих различные операции с архитектурой Вашего компьютера
Навигация по программе очень простая - просто нажимайте на верхние вкладки
На каждой вкладке есть инструкция и описание того, что
на них происходит, чтобы не вводить Вас в заблуждение
Приятного пользования!"
                }
            }
        }

        Item
        {
            Rectangle
            {
                id: rect111
                width: slider1.width + 100
                height: label1.height + slider1.height + label2.height + slider2.height + label3.height + slider3.height + label4.height + fontPointSize.height + 100
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                color: "#e6e3e3"
                border.color: "#000000"
                radius: 25

                Label
                {
                    id: label1
                    color: "red"
                    font.pointSize: 16
                    text: Math.floor(slider1.value)
                    anchors.bottom: slider1.top
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Slider {
                    id: slider1
                    from: 0
                    value: 255
                    to: 255
                    //anchors.top: label1.bottom
                    anchors.bottom: label2.top
                    anchors.horizontalCenter: label1.horizontalCenter
                }

                Label
                {
                    //anchors.top: slider1.bottom
                    id: label2
                    color: "green"
                    font.pointSize: label1.font.pointSize
                    text: Math.floor(slider2.value)
                    anchors.horizontalCenter: slider1.horizontalCenter
                    anchors.bottom: slider2.top
                }

                Slider {
                    id: slider2
                    from: 0
                    value: 255
                    to: 255
                    //anchors.top: label2.bottom
                    anchors.bottom: label3.top
                    anchors.horizontalCenter: label2.horizontalCenter
                }

                Label
                {
                    //anchors.top: slider2.bottom
                    id: label3
                    color: "blue"
                    font.pointSize: label1.font.pointSize
                    text: Math.floor(slider3.value)
                    anchors.horizontalCenter: slider2.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }

                Slider {
                    id: slider3
                    from: 0
                    value: 255
                    to: 255
                    anchors.top: label3.bottom
                    anchors.horizontalCenter: label3.horizontalCenter
                }

                Label
                {
                    anchors.top: slider3.bottom
                    id: label4
                    color: "black"
                    font.pointSize: fontPointSize.value
                    text: "Размер шрифта в pt: " + Math.floor(fontPointSize.value)
                    anchors.horizontalCenter: slider3.horizontalCenter
                }

                Slider {
                    id: fontPointSize
                    from: 10
                    value: 14
                    to: 24
                    anchors.top: label4.bottom
                    anchors.horizontalCenter: label4.horizontalCenter
                }
            }
        }

        Item{
            DmesgInfo{
                id: dmesgInfo
            }

            ScrollView{
                anchors.fill: parent
                clip: true
                ScrollBar.vertical.policy: ScrollBar.AlwaysOn

                Label{
                    font.pointSize: fontPointSize.value
                    wrapMode: "WordWrap"
                    verticalAlignment: "AlignTop"
                    text: dmesgInfo.GetDmesgInfo
                }
            }
        }

        Item{

            ProcessorInfo{
                id: cpuInfo
            }

            ScrollView{
                anchors.fill: parent
                clip: true
                ScrollBar.vertical.policy: ScrollBar.AlwaysOn
                //ScrollBar.horizontal.policy:ScrollBar.AlwaysOff
                Label{
                    font.pointSize: fontPointSize.value
                    wrapMode: "WordWrap"
                    verticalAlignment: "AlignTop"
                    text: cpuInfo.GetCpuInfo
                }
            }
        }

        Item{

            DevicesInfo{
                id: devicesInfo
            }
            ScrollView{
                anchors.fill: parent
                clip: true
                ScrollBar.vertical.policy: ScrollBar.AlwaysOn
                implicitHeight: height
                Label{
                    width: parent.width
                    font.pointSize: fontPointSize.value
                    wrapMode: "WordWrap"
                    verticalAlignment: "AlignTop"
                    text: devicesInfo.GetDevicesInfo
                }
            }
        }

        Item{

            RAMInfo{
                id: ramInfo
            }
            ScrollView{
                anchors.fill: parent
                clip: true
                ScrollBar.vertical.policy: ScrollBar.AlwaysOn
                implicitHeight: height
                Label{
                    width: parent.width
                    font.pointSize: fontPointSize.value
                    wrapMode: "WordWrap"
                    verticalAlignment: "AlignTop"
                    text: ramInfo.GetRAMInfo
                }
            }
        }

        Item
        {
            id: root
            focus: true
            Keys.onPressed: {
                if(event.key === Qt.Key_Up){
                    event.acceptable = true;
                    mesDialog.open()
                }

                if(event.key >= Qt.Key_F1 && event.key <= Qt.Key_F12){
                    event.acceptable = true;
                    indicatorSwitcher.pressAllIndicators();
                }
            }

            Rectangle
            {
                id:aaaa
                width: label123.width + 100
                height: label123.height + column123.height + 100
                anchors.verticalCenter: root.verticalCenter
                anchors.horizontalCenter: root.horizontalCenter
                color: "#e6e3e3"
                border.color: "#000000"
                radius: 25
                Label
                {
                    id: label123
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 14
                    wrapMode: "WordWrap"
                    horizontalAlignment: "AlignHCenter"
                    text: "В данном разделе демонстрируется работа с клавиатурой, а точнее имитация
 нажатия клавиш. При вводе в текстовое поле \"1\" и нажатии \"Нажми меня\"
 индикаторы на Вашей клавиатуре включаться и после некоторой задержки отключаться.

Программа также реагирует на нажатие клавиши вверх
Для этого необходимо нажать на текстовое поле
и нажать клавишу вверх на клавиатуре"

                }

                Column
                {
                    id: column123
                    anchors.top: label123.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    spacing: 10
                    Rectangle{
                        height: 40
                        width: 200
                        radius: 5
                        color: "white"
                        border.color: "#000000"
                        TextInput{
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            width: parent.width
                            height: parent.height

                            id: myText
                            font.pixelSize: 16
                            color: "#6b6b6b"
                        }
                    }
                    Button{

                        height: 40
                        width: 200
                        background: Rectangle{
                            color: "#6b6b6b"
                            radius: 5
                        }
                        contentItem: Text{
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            text: "Нажми меня"
                            color: "white"
                        }
                        onClicked:{
                            if(myText.text == "1"){
                                indicatorSwitcher.lightAllIndicators();
                            }
                        }

                    }
                }


            }

            Dialog
            {
                id: mesDialog;
                modal: modal
                width: 600
                height: 400
                contentItem: Rectangle{
                    id: mesDiaolgItem
                    color: "#e6e3e3"
                    focus: true

                    Label{
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        text: "Нажмите клавишу включения
                             любого индикатора клавиатуры"
                        font.pointSize: 16
                    }
                    Button{
                        id: navButton
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        anchors.margins: 10
                        height: 50
                        width: 100
                        background: Rectangle{
                            border.color: "#000000"
                            color: "#6b6b6b"
                            radius: 5
                        }
                        contentItem: Text{
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            text: "Выход"
                            color: "white"
                        }
                        onClicked: mesDialog.close()
                    }

                    Keys.onPressed: {
                        if(event.key === Qt.Key_CapsLock){
                            event.acceptable = true;
                            if(indicatorSwitcher.getCapsLockStatus()){
                                capsPressed.text = "CapsLock нажата";
                            }else{
                                capsPressed.text = "CapsLock отжата";
                            }
                            capsPressed.open();
                        }
                        if(event.key === Qt.Key_NumLock){
                            event.acceptable = true;
                            if(indicatorSwitcher.getNumLockStatus()){
                                numLockPressed.text = "NumLock нажата";
                            }else{
                                numLockPressed.text = "NumLock отжата";
                            }
                            numLockPressed.open();
                        }
                        if(event.key === Qt.Key_ScrollLock){
                            event.acceptable = true;
                            if(indicatorSwitcher.getScrollLockStatus()){
                                scrollLockPressed.text = "ScrollLock нажата";
                            }else{
                                scrollLockPressed.text = "ScrollLock отжата";
                            }
                            scrollLockPressed.open();
                        }
                    }
                }
                title: "Тыщ. Диалоговое окно"
            }

            MessageDialog{
                id: capsPressed
                modality: Qt.WindowModal
                title: "Пиф"
                text: "Вы нажали CapsLock"
                onAccepted: {
                    capsPressed.close();
                }
            }

            MessageDialog{
                id: numLockPressed
                modality: Qt.WindowModal
                title: "Паф"
                text: "Вы нажали NumLock"
                onAccepted: {

                    numLockPressed.close();
                }
            }

            MessageDialog{
                id: scrollLockPressed
                modality: Qt.WindowModal
                title: "Пуф"
                text: "Вы нажали ScrollLock"
                onAccepted: {

                    scrollLockPressed.close();
                }
            }

        }

        Item
        {
            Rectangle {
                id: page
                width: parent.width; height: parent.height
                color: "white"
                ScrollView{
                    anchors.fill: parent
                    clip: true
                    ScrollBar.vertical.policy: ScrollBar.AlwaysOn
                    padding: 15
                    contentHeight: charactBlock.height + picturesBlock.height
                    Rectangle{
                        height: 100
                        width: parent.width
                        color: "red"
                    }

                    Grid
                    {
                        anchors.fill: parent
                        rows: 3; columns: 1
                        spacing: 15
                        Layout.fillWidth: true

                        Rectangle
                        {
                            id: picturesBlock
                            height: 225
                            width: parent.width
                            ScrollView{
                                anchors.fill: parent
                                clip: true
                                ScrollBar.horizontal.policy: ScrollBar.AlwaysOn
                                //ScrollBar.vertical.policy: ScrollBar.AlwaysOff



                                Grid{
                                    anchors.fill: parent
                                    rows: 1; columns: 3;
                                    spacing: 10
                                    padding: 10
                                    Rectangle{
                                        width: 400
                                        height: 200
                                        Image{
                                            anchors.fill: parent
                                            source: "qrc:/projector_1.jpg"

                                        }
                                    }
                                    Rectangle{
                                        width: 350
                                        height: 200
                                        Image{
                                            anchors.fill: parent
                                            source: "qrc:/projector_2.jpg"

                                        }
                                    }
                                    Rectangle{
                                        width: 400
                                        height: 200
                                        Image{
                                            anchors.fill: parent
                                            source: "qrc:/projector_3.jpg"
                                        }
                                    }
                                }
                            }
                        }



                        Rectangle{
                            width: parent.width
                            height: 1
                            color: "#e6e3e3"
                        }
                        Rectangle{
                            id: charactBlock
                            height: 700
                            width: parent.width
                            ColumnLayout{
                                width: page.width
                                RowLayout{
                                    Rectangle{
                                        height: 50
                                        Layout.fillWidth: true
                                        Label{
                                            anchors.verticalCenter: parent.verticalCenter
                                            font.pointSize: 20
                                            text: "Характеристики"
                                        }
                                    }
                                }
                                RowLayout{
                                    Rectangle{
                                        height: 20
                                        Layout.fillWidth: true
                                        ColumnLayout{
                                            width: page.width
                                            RowLayout{
                                                Layout.fillWidth: true
                                                TableHeader{headerText: "Основные"}
                                            }
                                            RowLayout{
                                                ColumnLayout{
                                                    width: parent.width
                                                    TableElement{mainText: "Тип матрицы"; descText: "3LCD"}
                                                    TableElement{mainText: "Соотношение сторон"; descText: "16:10"}
                                                    TableElement{mainText: "Разрешение матрицы"; descText: "1280x800"}
                                                }
                                            }

                                            RowLayout{
                                                TableHeader{headerText: "Технические характеристики"}
                                            }
                                            RowLayout{
                                                ColumnLayout{
                                                    width: parent.width
                                                    TableElement{mainText: "Количество ламп"; descText: "1"}
                                                    TableElement{mainText: "Мощность лампы"; descText: "210 Вт"}
                                                    TableElement{mainText: "Контрастность"; descText: "15000:1"}
                                                }
                                            }
                                            RowLayout{
                                                TableHeader{headerText: "Интерфейсы"}
                                            }
                                            RowLayout{
                                                ColumnLayout{
                                                    width: parent.width
                                                    TableElement{mainText: "Bluetooth"; descText: "Нет"}
                                                    TableElement{mainText: "Wi-Fi"; descText: "802.11n (Wi-Fi 4)"}
                                                    TableElement{mainText: "VGA"; descText: "Вход/Выход"}
                                                    TableElement{mainText: "DVI"; descText: "Нет"}
                                                    TableElement{mainText: "HDMI"; descText: "2"}
                                                    TableElement{mainText: "DisplayPort"; descText: "Нет"}
                                                    TableElement{mainText: "USB"; descText: "2"}
                                                    TableElement{mainText: "Ethernet (LAN)"; descText: "Нет"}
                                                }
                                            }
                                            RowLayout{
                                                TableHeader{headerText: "Размеры и вес"}
                                            }
                                            RowLayout{
                                                ColumnLayout{
                                                    width: parent.width
                                                    TableElement{mainText: "Ширина"; descText: "302 мм"}
                                                    TableElement{mainText: "Высота"; descText: "92 мм"}
                                                    TableElement{mainText: "Глубина"; descText: "249 мм"}
                                                    TableElement{mainText: "Вес"; descText: "2.7 кг"}
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }

                    }
                }
                IndicatorSwitcher{
                    id: indicatorSwitcher
                }
            }
        }

        Item {
            Rectangle {
                    id: page1
                    width: parent.width; height: parent.height
                    color: "#e6e3e3"
                    Rectangle
                    {
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        width: parent.width-10
                        height: parent.height-10
                        color: "white"
                        radius: 10
                        border.color: "#000000"
                        ScrollView
                        {
                            id: scroller
                            anchors.fill: parent
                            clip: true
                            implicitHeight: height
                            padding: 25

                            Grid{
                                anchors.fill: parent
                                rows: 15; columns: 1;
                                spacing: 20
                                padding: 10
                                Rectangle{

                                    width: 452
                                    height: 332
                                    color: "#e6e3e3"
                                    radius: 10
                                    border.color: "#000000"
                                    Image{
                                        anchors.verticalCenter: parent.verticalCenter
                                        anchors.horizontalCenter: parent.horizontalCenter
                                        width: parent.width - 20
                                        height: parent.height - 20
                                        source: "qrc:/microprocessor1.jpg"
                                    }
                                }
                                Rectangle{
                                    height: 1
                                    color: "#000000"
                                    width: scroller.width - 200
                                }
                                Label{
                                    text: "1) Подключаем CLK к кнопке SW3, а также соединяем выводы TxD и RxD"
                                }
                                Rectangle{
                                    height: 1
                                    color: "#000000"
                                    width: scroller.width - 200
                                }

                                Label{
                                    text: "2) Подключаем все сигналы порта SIO1 к выводам микросхемы, а именно:
                        -P1CFG = 01Fh
                        -P2CFG = 0E0h
                        -P3CFG = 80h
                        -SIOCFG = 00h"
                                }
                                Rectangle{
                                    height: 1
                                    color: "#000000"
                                    width: scroller.width - 200
                                }
                                Label{
                                    text: "3) Заносим во внутренний регистр управления (БА + 3) число 83h:
                        -Порты БА + 0 и БА + 1 используются для доступа частоты
                        -Контроля по четности нет
                        -Обычное функционирование адаптера
                        -1 стоп-бит
                        -Длина слова = 8 бит"
                                }
                                Rectangle{
                                    height: 1
                                    color: "#000000"
                                    width: scroller.width - 200
                                }
                                Label{
                                    text: "4) Заносим делитель частоты 1, тоесть рабочая частота около 115 МГц"
                                }
                                Rectangle{
                                    height: 1
                                    color: "#000000"
                                    width: scroller.width - 200
                                }
                                Label{
                                    text: "5) Заносим во внутренний регистр управления (БА + 3) число 03h:
                        -Порты БА + 0 и БА + 1 используются для доступа к регистрам данных и разрешение прерываний
                        -Обычное функционирование адаптера
                        -Контроля по четности нет
                        -1 стоп-бит
                        -Длина слова = 8 бит"
                                }
                                Rectangle{
                                    height: 1
                                    color: "#000000"
                                    width: scroller.width - 200
                                }
                                Label{
                                    text: "6) В цикле сравниваем содержимое порта БА + 5 c 20h (32 в десятичной системе), таким образом проверяя 5 бит. Если 5 бит = 1, то это означает, что буферный регистр передатчика пуст
                        -Если буферный регистр пуст, то загружаем в порт БА + 5 данные(буфер данных передатчика из адреса 4100h)."
                                }
                                Rectangle{
                                    height: 1
                                    color: "#000000"
                                    width: scroller.width - 200
                                }
                                Label{
                                    text: "7) Возращаемся к пункту 6)"
                                }
                            }
                        }
                    }


                }
        }




    }
}








