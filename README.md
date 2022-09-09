# Dockerized Tasmota Device Manager
[Tasmota Device Manager](https://github.com/jziolkowski/tdm) is easy to use GUI application to manage, configure and monitor devices flashed with [Tasmota firmware](https://github.com/arendst/Tasmota)

I am in no way associated with the TDM project. I just created a tool (Makefile, Dockerfile, docker-compose.yaml) that run TDM in a Docker container.


## Kickstart
```sh
git clone https://github.com/mmalessa/dtdm.git`
cd dtdm
```
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
`make build` - builds a docker image. You only need to run once.  
`make up` - runs docker-compose up (with some parameters)  
See 'Makefile' for more details

## GUI
Web browser: http://localhost:5800  
VNC: localhost:5900

*...see docker-compose.yml -> services -> application -> ports*
