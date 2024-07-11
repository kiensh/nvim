return function(config)
    local temp = config.configurations[1]
    temp.pathBash = "/opt/homebrew/bin/bash"
    temp.pathMkfifo = "/usr/bin/mkfifo"
    temp.pathPkill = "/usr/bin/pkill"
end
