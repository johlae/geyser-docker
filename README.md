# geyser-docker
A simple Docker image for [GeyserMC](https://geysermc.org/) Standalone.
I kept finding super out-of-date Docker images for Geyser Standalone and got fed up.
The only modification I have made to this fork is using a modern JDK and fixing the download link.

## Docker Compose
This image is docker-compose friendly. Here's an example `docker-compose.yml` to get you up and running:
```
version: '3.7'

services:
  geysermc:
    image: stephenhamiltonc/geysermc:latest
    container_name: geysermc
    restart: unless-stopped
    stdin_open: true
    tty: true

    ports:
      - 19132:19132/tcp
      - 19132:19132/udp

    volumes:
      - '/host/path/to/folder:/data:rw'

    environment:
      - TZ=America/New_York
```

Of course, change `/host/path/to/folder` to a folder on the host machine.
In my setup, I have this set to `./data`, so it's in the same folder as the `docker-compose.yml` file.
This is where GeyserMC will throw its config files into.

## Floodgate
If you have Floodgate on your server, Geyser needs the `key.pem` file that it generates.
A simple solution to this is just copying the `key.pem` file from your server to the same folder as Geyser's `config.yml`.
Then, you can set `floodgate-key-file` to `/data/key.pem`.

## License
This is forked from [rveachkc/geyser-docker](https://github.com/rveachkc/geyser-docker).
As a result, this repository is covered under the MIT license.
