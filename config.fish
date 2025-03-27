if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_prompt
    if test "$(fish_vcs_prompt)" = ""
        set prompt (prompt_login) '> '
    else
        set prompt (prompt_login) '|'(fish_vcs_prompt) '> '
    end
    echo $prompt
end

function fish_right_prompt -d "Write out the right prompt"
    echo '<'$PWD'>'
end

function run-linters
    pushd ~/dev/csapat5
    isort .
    black .
    mypy .
    flake8 .
    pytest .
    popd
end

function venv
    source ./.venv/bin/activate.fish
end

set -U fish_greeting

set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_hide_untrackedfiles 1

set -g __fish_git_prompt_color_branch magenta 
set -g __fish_git_prompt_showupstream "informative"
set -g __fish_git_prompt_char_upstream_ahead "↑"
set -g __fish_git_prompt_char_upstream_behind "↓"
set -g __fish_git_prompt_char_upstream_prefix ""

set -g __fish_git_prompt_char_stagedstate "●"
set -g __fish_git_prompt_char_dirtystate "✚"
set -g __fish_git_prompt_char_untrackedfiles "…"
set -g __fish_git_prompt_char_conflictedstate "✖"
set -g __fish_git_prompt_char_cleanstate "✔"

set -g __fish_git_prompt_color_dirtystate blue
set -g __fish_git_prompt_color_stagedstate yellow
set -g __fish_git_prompt_color_invalidstate red
set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
set -g __fish_git_prompt_color_cleanstate green 
