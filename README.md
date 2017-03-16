# webdis
Run webdis server in docker container.

Includes a redis-server running in this container.

Get angular-webdis.js here: https://github.com/adamgoose/angular-webdis

Run with env vars set to match your redis server:
```
REDIS_SERVER_IP
REDIS_SERVER_PORT
```

Example: To test with the (non-persistent) redis-server running inside this container, you would run this container with the following env vars:
```
REDIS_SERVER_IP=127.0.0.1
REDIS_SERVER_PORT=6379
```

Example:
```
docker run -e REDIS_SERVER_IP=10.1.1.1 -e REDIS_SERVER_PORT=6379 <...>
```
