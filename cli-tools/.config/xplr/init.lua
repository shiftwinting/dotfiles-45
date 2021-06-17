version = "0.14.0"
local xplr = xplr
local keys = xplr.config.modes.builtin.default.key_bindings.on_key
keys["ctrl-f"] = {
    help = "search with preview",
    messages = {
        {
            BashExec = [===[
                PTH=$(cat "${XPLR_PIPE_DIRECTORY_NODES_OUT:?}" | awk -F / '{print $NF}' | fzf --preview "pistol '{}'")
                if [ -d "$PTH" ]; then
                  echo ChangeDirectory: "'"$PWD/${PTH:?}"'" >> "${XPLR_PIPE_MSG_IN:?}"
                  elif [ -f "$PTH" ]; then
                  echo FocusPath: "'"$PWD/${PTH:?}"'" >> "${XPLR_PIPE_MSG_IN:?}"
                fi
                ]===],
        }, "Refresh",
    },
}
keys.O = {help = "xdg-open", messages = {{BashExec = [[xdg-open ${XPLR_FOCUS_PATH:?}]]}}}
keys.y = {help = "copy", messages = {"PopMode", {SwitchModeCustom = "copy"}, "Refresh"}}
keys.p = {
    help = "paste",
    messages = {
        {
            BashExecSilently = [[xclip-pastefile > /dev/null && echo ExplorePwdAsync >> "${XPLR_PIPE_MSG_IN:?}"]],
        }, "Refresh",
    },
}
keys.R = {
    help = "batch rename",
    messages = {
        {
            BashExec = [[
                SELECTION=$(cat "${XPLR_PIPE_SELECTION_OUT:?}")
                NODES=${SELECTION:-$(cat "${XPLR_PIPE_DIRECTORY_NODES_OUT:?}")}
                if [ "$NODES" ]; then
                  echo -e "$NODES" | pipe-rename
                  echo ExplorePwdAsync >> "${XPLR_PIPE_MSG_IN:?}"
                fi]],
        }, "Refresh",
    },
}
keys.D = {help = "disk usage", messages = {{BashExec = [[dua i]]}, "ClearScreen", "Refresh"}}
keys["ctrl-n"] = {
    help = "new session",
    messages = {{BashExecSilently = [[wezterm start -- xplr &]]}, "Refresh"},
}
keys.P = {help = "paste.rs", messages = {"PopMode", {SwitchModeCustom = "paste.rs"}, "Refresh"}}
xplr.config.modes.custom = {
    ["paste.rs"] = {
        name = "paste.rs",
        key_bindings = {
            on_key = {
                p = {
                    help = "paste",
                    messages = {
                        {
                            BashExec = [[
                                PTH=$(basename "${XPLR_FOCUS_PATH:?}")
                                DEST="${XPLR_SESSION_PATH:?}/paste.rs.list"
                                curl --data-binary "@${PTH:?}" "https://paste.rs" | tee -a "${DEST:?}"
                                echo
                                read -p "[enter to continue]"]],
                        }, "PopMode", "Refresh",
                    },
                },
                l = {
                    help = "list",
                    messages = {
                        {
                            BashExec = [[
                                cat "${XPLR_SESSION_PATH:?}/paste.rs.list"
                                echo
                                read -p "[enter to continue]"]],
                        }, "PopMode", "Refresh",
                    },
                },
                o = {
                    help = "search and open",
                    messages = {
                        {
                            BashExec = [[
                                DEST="${XPLR_SESSION_PATH:?}/paste.rs.list"
                                URL=$(fzf --preview "curl -s '{}'" < "${DEST:?}")
                                if [ "$URL" ]; then
                                  OPENER=$(which xdg-open)
                                  ${OPENER:-open} "${URL:?}"
                                fi]],
                        }, "PopMode", "Refresh",
                    },
                },
                d = {
                    help = "search and delete",
                    messages = {
                        {
                            BashExec = [[
                                DEST="${XPLR_SESSION_PATH:?}/paste.rs.list"
                                URL=$(fzf --preview "curl -s '{}'" < "${DEST:?}")
                                if [ "$URL" ]; then
                                  curl -X DELETE "${URL:?}"
                                  sd "${URL:?}n" "" "${DEST:?}"
                                  echo
                                  read -p "[enter to continue]"
                                fi]],
                        }, "PopMode", "Refresh",
                    },
                },
                esc = {help = "cancel", messages = {"PopMode", "Refresh"}},
            },
        },
    },
    copy = {
        name = "copy",
        key_bindings = {
            on_key = {
                y = {
                    help = "copy focused file",
                    messages = {
                        {BashExecSilently = [[xclip-copyfile $(cat "${XPLR_PIPE_RESULT_OUT:?}")]]},
                        "PopMode", "Refresh",
                    },
                },
                esc = {help = "cancel", messages = {"PopMode", "Refresh"}},
            },
        },
    },
}
xplr.config.node_types = {
    directory = {meta = {icon = ""}},
    file = {meta = {icon = ""}},
    symlink = {meta = {icon = ""}},
}
