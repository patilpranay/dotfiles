#!/usr/bin/env python3
"""
Run this script from the directory containing the code you wish to index
"""
import os

def main():
  os.system("ctags --languages=java -R .") # universal-ctags

  os.system("find -name *.java > gtags.files")
  os.system("gtags") # GNU Global

if __name__ == "__main__":
  main()
