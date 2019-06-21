# On macOS, ~/.bash_profile is run every time a new shell is created.
# This sources ~/.bashrc so all customizations can be placed there.
if [ -f $HOME/.bashrc ]; then
  source $HOME/.bashrc
fi
