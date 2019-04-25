import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Flappy Bird")

    property int xBallValue: 150
    property int yBallValue: 250

    property int xWall1: 200
    property int xWall2: 400
    property int xWall3: 600

    Item {
        id:root
        anchors.fill: parent
        focus: true
        Timer {
            interval: 500; running: true; repeat: true
            onTriggered: {
                time.text = Date().toString()
                if(yBallValue > parent.height) {
                    console.log("game over");
                }
                if(xWall1 <0) {
                    xWall1 = parent.width
                }
                if(xWall2 <0) {
                    xWall2 =parent.width
                }
                if(xWall3 <0) {
                    xWall3 =parent.width
                }


                yBallValue +=20
                xWall1-=40
                xWall2-=40
                xWall3-=40
            }
        }
        Image {
            id: background
            width: parent.width
            height: parent.height
            source: "qrc:/bg.png"
        }

        Image {
            id:wall1
            x:xWall1 +20
            y:-150
            source: "qrc:/pipe.png"
            rotation: 180
        }

        Image {
            id:wall11
            x:xWall1
            y:300
            source: "qrc:/pipe.png"
        }
        Image {
            id: wall21
            x:xWall2 +20
            y:-140
            source: "qrc:/pipe.png"
            rotation: 180
        }

        Image {
            id: wall22
            x:xWall2
            y:300
            source: "qrc:/pipe.png"
        }

        Image {
            id: wall31
            x:xWall3 +20
            y:-140
            source: "qrc:/pipe.png"
            rotation: 180
        }

        Image {
            id: wall32
            x:xWall3
            y:300
            source: "qrc:/pipe.png"
        }
        Keys.onSpacePressed: {
            console.log("hello");
            yBallValue -=20
        }

        Text { id: time }

        Rectangle {
            id:ball
            x:xBallValue
            y:yBallValue
            width: 50
            height: 50
            radius: 25
            color: "red"
        }
    }
}

