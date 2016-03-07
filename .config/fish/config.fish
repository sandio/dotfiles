set -Ux EDITOR vim
set -Ux BROWSER uzbl-browser
set -Ux LESS -RFXi
set -gx HOSTNAME (hostname)
set fish_greeting ""
if status --is-interactive;
    eval (keychain --eval --quiet -Q lamp_rsa github_rsa bitbucket_rsa)
end
source ~/.config/fish/functions/chruby.fish
chruby ruby-2.3.0
