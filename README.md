# @paulfri's dotfiles

## Installation
1. Create new SSH keypair, and add to GitHub.
```sh
ssh-keygen -t rsa -b 4096 -C paulrfri@gmail.com
eval "$(ssh-agent -s)"
ssh-add -K ~/.ssh/id_rsa
pbcopy < ~/.ssh/id_rsa.pub
```

2. Clone this repository.
```sh
mkdir $HOME/src
cd $HOME/src
git clone git@github.com:paulfri/dotfiles
```

3. Run the setup script.
```sh
cd $HOME/src
bin/setup
```

## Other stuff

* Remap caps lock to control.
* Swap option/command on external keyboards.
* Install:
  * 1Password (https://1password.com/downloads/)
  * Chrome (https://www.google.com/chrome/)
  * Dash (https://kapeli.com/dash)
  * Docker for Mac (https://store.docker.com/editions/community/docker-ce-desktop-mac)
  * Dropbox (https://www.dropbox.com/install)
  * Firefox Developer Edition (https://www.mozilla.org/en-US/firefox/developer/)
  * iTerm (https://www.iterm2.com/)
  * Pocket Casts (https://playbeta.pocketcasts.com/web/settings/apps)
  * Slack (https://slack.com/downloads/osx)
  * Telegram (https://desktop.telegram.org/)
* App Store:
  * Calcbot (https://itunes.apple.com/us/app/calcbot-the-smart-calculator/id931657367?mt=12)
  * DaisyDisk (https://itunes.apple.com/us/app/daisydisk/id411643860?mt=12)
  * Pastebot (https://itunes.apple.com/us/app/pastebot/id1179623856?mt=12)
  * Tweetbot 2 (https://itunes.apple.com/us/app/tweetbot-2-for-twitter/id557168941?mt=12)
  * Tweetbot 3 (https://itunes.apple.com/us/app/tweetbot-3-for-twitter/id1384080005?mt=12)
  * Xscope 4 (https://itunes.apple.com/us/app/xscope-4/id889428659?mt=12)
