# Dockerized Tasmota Device Manager
[Tasmota Device Manager](https://github.com/jziolkowski/tdm) is easy to use GUI application to manage, configure and monitor devices flashed with [Tasmota firmware](https://github.com/arendst/Tasmota)

## Kickstart
```sh
make build
make up
make down
```
and
```sh
make logs
make console
```

## GUI
Web browser: http://localhost:5800  
VNC: localhost:5900

*...see docker-compose.yml -> services -> application -> ports*