# Theme based on Bira theme from oh-my-zsh: https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/bira.zsh-theme
# Some code stolen from oh-my-fish clearance theme: https://github.com/bpinto/oh-my-fish/blob/master/themes/clearance/

#copy this place ~/.local/share/omf/themes/bira/functions/

## this is not working
function __user_host
  set -l content 
  if [ (id -u) = "0" ];
    echo -n (set_color --bold red)
  else
    echo -n (set_color --bold green)
  end
  #echo -n $USER@(hostname|cut -d . -f 1) (set color normal)
end
## this is not working


function __current_path
  echo -n (set_color --bold blue) (pwd) (set_color normal) 
end

function _git_branch_name
  echo (command git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
end

function _git_is_dirty
  echo (command git status -s --ignore-submodules=dirty 2> /dev/null)
end

function __git_status
  if [ (_git_branch_name) ]
    set -l git_branch (_git_branch_name)

    if [ (_git_is_dirty) ]
      set git_info '<'$git_branch"*"'>'
    else
      set git_info '<'$git_branch'>'
    end

    echo -n (set_color yellow) $git_info (set_color normal) 
  end
end

function __ruby_version
  if type "rvm-prompt" > /dev/null 2>&1
    set ruby_version (rvm-prompt i v g)
  else if type "rbenv" > /dev/null 2>&1
    set ruby_version (rbenv version-name)
  else
    set ruby_version "system"
  end

  echo -n (set_color red) ‹$ruby_version› (set_color normal)
end

function fish_prompt
  echo -n (set_color white)"___:"(set_color normal)
  __user_host
  __current_path
  __ruby_version
  __git_status
  echo -e (set_color white)' '(set_color normal)
  echo (set_color white)"(|════════|Life is GnuChan|═════"(set_color white)"══════|)"(set_color normal)
  echo (set_color white)"(|════════|"(set_color white)"<:GnuChanOs:>|═════════════|)"(set_color normal)
  echo (set_color white)"(╚════════"(set_color  white)" What You Need? ════════════╝)  :"(set_color normal)
end
function fish_right_prompt
  set -l st $status

  if [ $st != 0 ];
    echo (set_color red) ↵ $st(set_color normal)
  end
end
