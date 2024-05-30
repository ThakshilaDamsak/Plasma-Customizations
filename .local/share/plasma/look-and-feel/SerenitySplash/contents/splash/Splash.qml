import QtQuick
import org.kde.kirigami 2 as Kirigami

Rectangle {
    id: root
    color: "#312F31"

    property int stage

    onStageChanged: {
        if (stage == 1) {
            introAnimation.running = true
        }
    }
    Item {
        id: content
        anchors.fill: parent
        opacity: 0
        TextMetrics {
            id: units
            text: "M"
            property int gridUnit: boundingRect.height
            property int largeSpacing: units.gridUnit
            property int smallSpacing: Math.max(2, gridUnit/4)
        }
       
        AnimatedImage {
            id: logo
            property real size: units.gridUnit * 12
            anchors.centerIn: parent
            source: "images/logo.gif"
            sourceSize.width: 300
            sourceSize.height: 300
            opacity: 0.8
        }
    }

    Row {
        opacity: 0.5
        spacing: units.smallSpacing*2
        anchors {
            bottom: parent.bottom
            // right: parent.right
            margins: units.gridUnit
        }
        anchors.horizontalCenter: parent.horizontalCenter
        Text {
            id: text
            color: "#eff0f1"
            anchors.verticalCenter: parent.verticalCenter
            text: "Welcome to Serenity. Boo! Powered by Plasma."

                        ParallelAnimation {
                running: true

                SequentialAnimation {
                    loops: Animation.Infinite

                    OpacityAnimator {
                        target: text
                        from: 0.5
                        to: 1
                        duration: 1000
                    }
                    OpacityAnimator {
                        target: text
                        from: 1
                        to: 0.5
                        duration: 1000
                    }
                }
            }
        }
        Image {

            id: kde
            source: "images/kde.svgz"
            sourceSize.height: units.gridUnit * 1
            sourceSize.width: units.gridUnit * 1

            ParallelAnimation {
                running: true

                SequentialAnimation {
                    loops: Animation.Infinite

                    OpacityAnimator {
                        target: kde
                        from: 0.5
                        to: 1
                        duration: 1000
                    }
                    OpacityAnimator {
                        target: kde
                        from: 1
                        to: 0.5
                        duration: 1000
                    }
                }
            }
        }
    }

    OpacityAnimator {
        id: introAnimation
        running: false
        target: content
        from: 0
        to: 1
        duration: 1000
        easing.type: Easing.InOutQuad
    }
}
