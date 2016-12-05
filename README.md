# docker-nginx-modsecurity
Dockerfiles for nginx with modsecurity module

## Base Images

 - debian:sid
 
## Tags

### build

 - Compile and Installation
 
### latest

 - Runs nginx on non daemon mode with modsecurity enabled and with recommended rules file loaded.

### Create Docker container
 - docker create -p 8888:80 -t --name ninja fooinha/nginx-modsecurity 
