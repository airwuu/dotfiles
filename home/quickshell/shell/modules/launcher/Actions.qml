pragma Singleton

import "root:/utils/scripts/fuzzysort.js" as Fuzzy
import "root:/services"
import "root:/config"
import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root

    // FIX: Use list<var> to avoid type conflicts
    readonly property list<var> list: [
        Action {
            name: qsTr("Scheme")
            desc: qsTr("Change the current colour scheme")
            icon: "palette"

            function onClicked(list): void {
                 root.autocomplete(list, "scheme");
            }
        },
        Action {
            name: qsTr("Wallpaper")
            desc: qsTr("Change the current wallpaper")
            icon: "image"

            function onClicked(list): void {
                root.autocomplete(list, "wallpaper");
            }
        },
        Action {
            name: qsTr("Variant")
            desc: qsTr("Change the current scheme variant")
            icon: "colors"

            function onClicked(list): void {
                root.autocomplete(list, "variant");
            }
        },
        Action {
            name: qsTr("Transparency")
            desc: qsTr("Change shell transparency")
            icon: "opacity"

            function onClicked(list): void {
                root.autocomplete(list, "transparency");
            }
        },
        Action {
            name: qsTr("Light")
            desc: qsTr("Change the scheme to light mode")
            icon: "light_mode"

            function onClicked(list): void {
                list.visibilities.launcher = false;
                Colours.setMode("light");
            }
        },
        Action {
            name: qsTr("Dark")
            desc: qsTr("Change the scheme to dark mode")
            icon: "dark_mode"

            function onClicked(list): void {
                list.visibilities.launcher = false;
                Colours.setMode("dark");
            }
        },
        Action {
            name: qsTr("Shutdown")
            desc: qsTr("Shutdown the system")
            icon: "power_settings_new"

            function onClicked(list): void {
                list.visibilities.launcher = false;
                shutdown.running = true;
            }
        },
        Action {
            name: qsTr("Reboot")
            desc: qsTr("Reboot the system")
            icon: "cached"

            function onClicked(list): void {
                list.visibilities.launcher = false;
                reboot.running = true;
            }
        },
        Action {
            name: qsTr("Logout")
            desc: qsTr("Logout of the current session")
            icon: "logout"

            function onClicked(list): void {
                list.visibilities.launcher = false;
                logout.running = true;
            }
        },
        Action {
            name: qsTr("Lock")
            desc: qsTr("Lock the current session")
            icon: "lock"

            function onClicked(list): void {
                list.visibilities.launcher = false;
                lock.running = true;
            }
        },
        Action {
            name: qsTr("Sleep")
            desc: qsTr("Suspend then hibernate")
            icon: "bedtime"

            function onClicked(list): void {
                list.visibilities.launcher = false;
                sleep.running = true;
            }
        }
    ]

    readonly property list<var> preppedActions: list.map(a => ({
                name: Fuzzy.prepare(a.name),
                desc: Fuzzy.prepare(a.desc),
                action: a
            }))

    function fuzzyQuery(search: string): var {
        return Fuzzy.go(search.slice(LauncherConfig.actionPrefix.length), preppedActions, {
            all: true,
            keys: ["name", "desc"],
            scoreFn: r => r[0].score > 0 ? r[0].score * 0.9 + r[1].score * 0.1 : 0
        }).map(r => r.obj.action);
    }

    function autocomplete(list, text: string): void {
        list.search.text = `${LauncherConfig.actionPrefix}${text} `;
    }

    Process {
        id: shutdown
        command: ["systemctl", "poweroff"]
    }

    Process {
        id: reboot
        command: ["systemctl", "reboot"]
    }

    Process {
        id: logout
        command: ["sh", "-c", "(uwsm stop | grep -q 'Compositor is not running' && loginctl terminate-user $USER) || uwsm stop"]
    }  

    Process {
        id: lock
        command: ["loginctl", "lock-session"]
    }

    Process {
        id: sleep
        command: ["systemctl", "suspend-then-hibernate"]
    }

    // NOTE: The inline 'component Action' that was here has been removed.
    // It is now replaced by the separate Action.qml file.
}
