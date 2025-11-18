if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_prompt
    echo $($HOME/repos/emerald-prompt/bin/emerald fish)
end

