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
                left: true
            }

            implicitWidth: screen.width / 2
            implicitHeight: 18
            aboveWindows: true
            color: "#00FF0000"

            exclusionMode: ExclusionMode.Ignore // set to .auto to take space

            mask: Region {}

            Row {
                anchors.fill: parent
                anchors.leftMargin: 8
                anchors.rightMargin: 8
                // layoutDirection: Qt.RightToLeft
                spacing: 8

                Rectangle {
                    implicitHeight: parent.height
                    implicitWidth: screenName.contentWidth
                    color: "#00666666"
                    Text {
                        id: screenName
                        anchors.centerIn: parent
                        text: leftSidePanel.screen.name
                        color: "#a9b1d6"
                        font.pixelSize: 12
                    }
                }

                Rectangle {
                    implicitHeight: parent.height
                    implicitWidth: focusedWorkwpaceId.contentWidth
                    color: "#00666666"
                    Text {
                        id: focusedWorkwpaceId
                        anchors.centerIn: parent
                        text: Hyprland.focusedWorkspace.id
                        color: "#a9b1d6"
                        font.pixelSize: 12
                    }
                }
            }
        }
    }
}
