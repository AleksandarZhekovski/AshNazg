import QtQuick
import Quickshell
// import Quickshell.Wayland
import Quickshell.Hyprland

Scope {
    id: tabs
    ShellRoot {
        Variants {
            model: Quickshell.screens

            PanelWindow {
                anchors.top: true
                anchors.left: true
                anchors.right: true

                margins.left: 2
                margins.right: 2

                implicitHeight: 20
                color: "transparent"
                aboveWindows: true
                exclusiveZone: 0

                mask: Region {}

                Text {
                    anchors.right: parent
                    text: "%1".arg(Hyprland.focusedWorkspace.id)
                    color: "#a9b1d6"
                    font.pixelSize: 14
                }
            }
        }
    }
}
