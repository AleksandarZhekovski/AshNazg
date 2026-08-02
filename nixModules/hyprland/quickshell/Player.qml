import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Services.Mpris

Scope {
  id: playerScope

  PwObjectTracker {
    objects: [Pipewire.defaultAudioSink]
  }

  property bool bigMode: false

  readonly property var playersList: {
    var list = Mpris.players.values;
    return list;
  }

  Connections {
    // target: playerScope
    target: Pipewire.defaultAudioSink?.audio

    function postTrackChanged() {
      playerScope.bigMode = true;
      hideTimer.restart();
    }


    function onVolumeChanged() {
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
      id: playerInfoPanel
      anchors.top: true
      margins.top: screen.height / 4
      exclusiveZone: 0

      implicitWidth: 800
      implicitHeight: 400
      color: "transparent"

      Rectangle {
        id: playerInfoBox
        anchors.fill: parent
        radius: 10
        color: "transparent"

        Rectangle {
          id: playerTextBox
          color: "transparent"
          implicitWidth: (parent.width / 10) * 7
          radius: parent.radius
          anchors {
            top: parent.top
            // right: parent.centerIn
            bottom: parent.bottom
          }

          Rectangle {
            id: trackName
            color: "#215e61"
            radius: parent.radius
            implicitHeight: 40
            anchors {
              top: parent.top
              right: parent.right
              left: parent.left
              margins: 10
            }

            Text {
              anchors.centerIn: parent
              text: playerScope.playersList[0].trackTitle || "UA"
              color: "White"
              font.pixelSize: 20
            }
          }

          Rectangle {
            id: trackAlbum
            color: "#215e61"
            radius: parent.radius
            implicitHeight: 40
            anchors {
              top: trackName.bottom
              right: parent.right
              left: parent.left
              margins: 10
            }

            Text {
              anchors.centerIn: parent
              text: playerScope.playersList[0].trackAlbum || "UA"
              color: "White"
              font.pixelSize: 16
            }
          }

          Rectangle {
            id: trackArtist
            color: "#215e61"
            radius: parent.radius
            implicitHeight: 40
            anchors {
              top: trackAlbum.bottom
              right: parent.right
              left: parent.left
              margins: 10
            }

            Text {
              anchors.centerIn: parent
              text: playerScope.playersList[0].trackArtist || "UA"
              color: "White"
              opacity: 1
              font.pixelSize: 16
            }
          }
        }


        Rectangle {
          id: playerImgBox
          color: "transparent"
          implicitWidth: (parent.width / 10) * 3
          implicitHeight: width
          radius: parent.radius

          anchors {
            top: parent.top
            right: parent.right
            // left: playerTextBox.right
            // bottom: parent.bottom
          }

          Rectangle {
            id: albumImage
            color: "#215e61"
            radius: parent.radius
            anchors {
              top: parent.top;
              left: parent.left;
              right: parent.right;
              bottom: parent.bottom;

              topMargin: 10
              leftMargin: 10
              rightMargin: 10
              bottomMargin: 10
            }

            Image {
              height: 160
              width: 160
              anchors.horizontalCenter: parent.horizontalCenter
              anchors.verticalCenter: parent.verticalCenter
              // horizontalAlignment: Image.AlignHCenter
              // VerticalAlignment: Image.AlignVCenter
              fillMode: Image.PreserveAspectFit
              source: playerScope.playersList[0].trackArtUrl || "UA"
            }
          }
        }
      }
    }
  }
}
