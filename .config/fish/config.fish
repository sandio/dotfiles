set PATH $PATH /usr/local/bin
set PATH $PATH .local/bin
set -gx EDITOR vim
set -gx BROWSER surf
set -gx LESS -RFXi
set -gx HOSTNAME (hostname)
set -gx GOPATH ~/go
set fish_greeting ""
set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_char_untrackedfiles ""
if status --is-interactive;
    eval (keychain --eval --quiet -Q lamp_rsa github_rsa bitbucket_rsa gitlab_rsa)
end
source /usr/local/share/chruby/chruby.fish
set -gx CHRUBY_ROOT /usr
chruby ruby-2.4.3
