# @paulfri's dotfiles

1. Install 1Password and Chrome.

2. Create new SSH keypair, and add to GitHub.
```sh
ssh-keygen -t rsa -b 4096 -C paulrfri@gmail.com
eval "$(ssh-agent -s)"
ssh-add -K ~/.ssh/id_rsa
pbcopy < ~/.ssh/id_rsa.pub
```

3. Clone this repository.
```sh
mkdir $HOME/src
cd $HOME/src
git clone git@github.com:paulfri/dotfiles
```

4. Run the setup script.
```sh
cd $HOME/src
bin/setup
```
