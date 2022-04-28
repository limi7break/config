aliases=(
    "alias l='ls -lah'"
    "alias clear='clear && printf \"\\e[3J\"'"
    "alias c='clear'"
    "alias python='python3'"
)

for alias in "${aliases[@]}"; do
    if ! grep -Fxq "$alias" ~/.bashrc; then
        echo "$alias" >> ~/.bashrc
    fi
done