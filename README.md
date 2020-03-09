# org2web

_org2web_ is a small utility to serve your org files over your local network.

Your org file folder is mounted to the container as _read-only_ volume. A cron job inside the container pools the files (via makefile) and takes charge if there are new ones or modifications to the existing ones. The conversion is per formed with pandoc, and the output placed at `/usr/share/nginx/html/`.

## Usage
### Build

Build the docker container with:

`docker build . -t lb803/org2web`

### Run
`docker run --rm --name org2web -d -p 80:80 -v /home/luca/obp/org-files/:/org-files:ro lb803/org2web`
