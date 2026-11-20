import QtQuick
import Quickshell
import Quickshell.Hyprland

Scope {
    id: tabs
    Variants {
        model: Quickshell.screens

        PanelWindow { // qmllint disable uncreatable-type
            id: leftSidePanel

            required property var modelData
            screen: modelData

            anchors {
                top: true
                right: true
                left: true
            }

            // implicitWidth: screen.width / 2
            implicitHeight: 12
            aboveWindows: true
            color: "#00FF0000"

            exclusionMode: ExclusionMode.Ignore // set to .auto to take space

            mask: Region {}
            // Text {
            //     anchors {
            //         centerIn: parent
            //     }
            //     text: Hyprland.focusedWorkspace.id //+ " " + modelData.monitor.name
            //     color: "red"
            //
            //     font.pixelSize: 10
            // }

            Rectangle {
                anchors.centerIn: parent
                implicitHeight: parent.height
                width: 272
                color: "#00FF00FF"
                Row {
                    anchors.fill: parent
                    spacing: 8

                    Repeater {
                        model: Hyprland.workspaces

                        delegate: Rectangle {
                            id: workplaceButton
                            implicitHeight: parent.height
                            width: 20
                            color: "transparent"

                            Rectangle {
                                anchors {
                                    top: parent.top
                                    right: parent.right
                                    left: parent.left
                                }
                                height: 4
                                color: leftSidePanel.screen.name == modelData.monitor.name ? "#8000FF00" : "#80666666"
                            }

                            Text {
                                anchors {
                                    centerIn: parent
                                }
                                text: modelData.id //+ " " + modelData.monitor.name
                                color: modelData.focused ? "red" : "#a9b1d6"

                                font.pixelSize: 10
                            }
                        }
                    }
                }
            }
        }
    }
}
