import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Mpris

Scope {
    id: playerScope

    property bool bigMode: false

    readonly property var playersList: {
        var list = Mpris.players.values;
        return list;
    }

    Connections {
        target: playerScope

        function trackChanged() {
            playerScope.bigMode = true;
            hideTimer.restart();
        }
    }

    Timer {
        id: hideTimer
        interval: 1400
        onTriggered: playerScope.bigMode = false
    }

    LazyLoader {
        active: playerScope.bigMode

        PanelWindow {
            id: hello
            anchors.top: true
            margins.top: screen.height / 4
            exclusiveZone: 0

            implicitWidth: 800
            implicitHeight: 600
            color: "transparent"

            Rectangle {
                anchors.fill: parent
                color: "#80000000"

                Text {
                    anchors.centerIn: parent
                    text: playerScope.playersList[0].trackTitle || "UA"
                    color: "blue"
                    font.pixelSize: 22
                }
            }
        }
    }
}
