# Search for files.
f() {
  find . -name "*$@*"
}

# For GnuPG signing to work correctly.
GPG_TTY=$(tty)
export GPG_TTY
