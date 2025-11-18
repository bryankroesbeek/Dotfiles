if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_prompt
    echo ($HOME/repos/emerald-prompt/bin/emerald fish)
end

set -gx COLORTERM truecolor

fish_add_path -a $HOME/.local/bin
fish_add_path -a $HOME/.local/scripts
fish_add_path -a $HOME/.dotnet/tools
