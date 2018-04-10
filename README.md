# Easy Remote Pair Programming Using Docker and Tmux

This Ubuntu based container provides an easy-to-use Server to perform remote pair programming. It uses password authentication via SSH.

## Getting started

Use `make build` and `make run` to build the image and start a container from it. The SSH password will be printed in the container log. You can check this using `docker logs pairprog`. After that, connet with `ssh -p 9898 <Domain/IP>`.

## Starting a new tmux session

The first user that connects to the SSH server has to execute `tmux new -s yolo` to create a new shared tmux session.
# tmux new -s myname

## Attaching to an existing session

Use `tmux a` to attach to the previously created session. This will be performed for every guest.

## Persistence

By default, the folder `data` will get mounted into the container to persist created data.

