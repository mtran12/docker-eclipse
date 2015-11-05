# Docker Image for Eclipse

## Why

## Usage

This launches the latest version of Eclipse, with your `~/workspace` folder mounted to `~eclipse/workspace/` in the container.

```bash
$ docker run -v ~/workspace/:/home/eclipse/workspace/ \
  -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
  -d leesah/eclipse
```

To launch an earlier version of Eclipse, run with `leesah/eclipse:<version>`. For example:

```bash
$ docker run -v ~/workspace/:/home/eclipse/workspace/ \
  -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
  -d leesah/eclipse:mars
```

## Troubleshooting

If you have trouble opening the window, try this:

```bash
$ xhost +si:localuser:eclipse
```
