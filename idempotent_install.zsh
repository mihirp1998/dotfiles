export BIN="$HOME/bin"

command -v eget >/dev/null 2>&1 || curl https://zyedidia.github.io/eget.sh | sh;
command -v gdu >/dev/null 2>&1 || (eget dundee/gdu --asset 'static' --to $BIN/gdu && chmod +x $BIN/gdu && echo "Installed gdu");
command -v zoxide >/dev/null 2>&1 || (eget ajeetdsouza/zoxide --to $BIN/zoxide && chmod +x $BIN/zoxide && echo "Installed zoxide");
command -v gotop >/dev/null 2>&1 || (eget xxxserxxx/gotop --asset '.tgz' --to $BIN/gotop && chmod +x $BIN/gotop && echo "Installed gotop");
command -v exa >/dev/null 2>&1 || (eget ogham/exa --asset 'musl' --to $BIN/exa && chmod +x $BIN/exa && echo "Installed exa");
command -v bat >/dev/null 2>&1 || (eget sharkdp/bat --asset 'musl' --to $BIN/bat && chmod +x $BIN/bat && echo "Installed bat");
command -v starship >/dev/null 2>&1 || (eget starship/starship --asset 'musl' --to $BIN/starship && chmod +x $BIN/starship && echo "Installed starship");
command -v gh >/dev/null 2>&1 || (eget cli/cli --asset '.tar.gz' --to $BIN/gh && chmod +x $BIN/gh && echo "Installed gh");
command -v fzf >/dev/null 2>&1 || (eget junegunn/fzf --to "$BIN/fzf" && chmod +x $BIN/fzf && echo "Installed fzf");