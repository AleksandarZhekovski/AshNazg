import Quickshell
import QtQuick
import Quickshell.Wayland
import Quickshell.Services.UPower

Scope {
    id: root

    function whenBatLow() {
        root.shouldShowOsd = true;
    }

    property bool shouldShowOsd: true

    LazyLoader {
        active: ((UPower.displayDevice.percentage * 100) > 15) ? false : true
        // active: UPower.onBattery

        PanelWindow {
            anchors.top: true
            anchors.left: true
            anchors.right: true

            margins.left: 2
            margins.right: 2

            implicitHeight: 20
            color: "red"
            aboveWindows: true
            exclusiveZone: 0

            mask: Region {}

            Text {
                anchors.centerIn: parent
                text: "Hello %1".arg(UPower.displayDevice.percentage * 100)
                color: "#a9b1d6"
                font.pixelSize: 14
            }
        }
    }
}
