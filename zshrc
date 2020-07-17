# Search for files (case-insensitive)
f() {
  find . -iname "*$@*"
}
