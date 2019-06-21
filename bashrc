# Search for files.
f() {
  find . -name "*$@*"
}

# For GnuPG signing to work correctly.
GPG_TTY=$(tty)
export GPG_TTY

# To avoid consistently entering SSH key password. Asks for password once.
eval $(ssh-agent)
ssh-add
