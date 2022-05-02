cat <<EOF > ~/.limitbreak
# Navigation

alias l='ls -lah --group-directories-first'
alias c='clear'
alias clear='clear && printf "\e[3J"'

# Python stuff

alias python='python3'
activate () {
    source $1/bin/activate
}
EOF
if ! grep -Fxq "source ~/.limitbreak" ~/.bashrc; then
    echo "source ~/.limitbreak" >> ~/.bashrc
fi
source ~/.bashrc
