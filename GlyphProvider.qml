pragma Singleton
import Quickshell
import QtQuick

Singleton {

    property var glyphMap: ({
        "firefox":  "󰈹",
        "mozilla":  "󰈹",
        "telegram": "",
        "spotify":  "",
        "discord":  "",
        "chrome_status_icon_1":  "",
        "blueman": "",

        "terminal" : "",
        "web": "󰖟",
        "code": "",
        "music": "",
        "message": "",
        "arch": "󰣇",

        "volume_0":"",
        "volume_1":"",
        "volume_2":"",
        "volume_off":"",
        "headphones":"󰋋",
        "headphones_off":"󰟎",

        
        

        "battery_0":"",
        "battery_1":"",
        "battery_2":"",
        "battery_3":"",
        "battery_4":"",

        "wifi_0":"󰤯",
        "wifi_1":"󰤟",
        "wifi_2":"󰤢",
        "wifi_3":"󰤥",
        "wifi_4":"󰤨",
        "lan":"󰌗",
        
        "open_bracket":"[",
        "close_bracket":"]",
        
        "power_off":"⏻",
        "reboot":"",
        "lock":"",
        "sleep":"󰒲",

        "menu":"",

        "backward":"",
        "pause": "",
        "play": "",
        "forward":"",
        
        "close":"",


        "unknown":""
    })

    function glyphFor(name) {
         if (!name)
            return glyphMap["unknown"]

        name = name.toLowerCase()

        for (var key in glyphMap) {
            if (name==key)
                return glyphMap[key]
        }

        return glyphMap["unknown"]
    }
}
