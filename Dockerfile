FROM ubuntu:20.04

LABEL maintainer="Pranay Patil <patilpranay@gmail.com>"

COPY <SOURCE_PATH> <DESTINATION_PATH>

CMD ["sleep", "100"]
