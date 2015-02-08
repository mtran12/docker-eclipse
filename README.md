# Docker Image for Eclipse

## Why

## Usage

```bash
$ xhost +si:localuser:eclipse
$ docker run -v ~/workspace/:/home/eclipse/workspace/ \
  -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
  -d leesah/eclipse
```
