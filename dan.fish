
# nvm
source --bash $HOME/.nvm/nvm.sh

test -s /Users/dan/.nvm-fish/nvm.fish; and source /Users/dan/.nvm-fish/nvm.fish


# ALIASES
alias vmstart 'VBoxManage startvm "testserver" --type headless'
alias vmstop 'VBoxManage controlvm "testserver" poweroff'
alias sshvm 'ssh 192.168.56.10 -l rsyncadmin'
alias cksql 'mysql -h 10.100.100.150 -u dan.eagle -p ck'
alias vmfix 'sudo launchctl load /Library/LaunchDaemons/org.virtualbox.startup.plist'
alias vmnfs 'mount -o nolocks,locallocks -t nfs 192.168.56.10:/var/www/git-repos /Users/dan/Development/nfs'
alias vtop 'vtop --theme=wizard'
alias sshva '/Users/dan/ck-repos/ckvm vagrant ssh'
alias vagup '/Users/dan/ck-repos/ckvm vagrant up'
alias vaghalt '/Users/dan/ck-repos/ckvm vagrant halt'

# PROMPT
set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_hide_untrackedfiles 1

set -g __fish_git_prompt_color_branch magenta bold
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
set -g __fish_git_prompt_color_cleanstate green bold


function fish_prompt --description 'Write out the prompt'

  set -l last_status $status

  if not set -q __fish_prompt_normal
    set -g __fish_prompt_normal (set_color normal)
  end

  # PWD
  set_color $fish_color_cwd
  echo -n (prompt_pwd)
  set_color normal

  printf '%s ' (__fish_git_prompt)

  if not test $last_status -eq 0
  set_color $fish_color_error
  end

  echo -n '$ '

end
