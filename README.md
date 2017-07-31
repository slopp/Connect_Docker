## Connect Docker

To use, clone this repo. Set the following environment variables:

```bash
export CONNECT_LICENSE=some_valid_license
export CONNECT_BINARY_URL=url_to_deb_file
```

Then run:

```bash
make build start
```

Connect will be available at: http://localhost:3939. The Connect logs will print in the foreground. To stop Connect, interrupt the container with Ctrl-D.

Emails will be printed to the log. 

Current config uses SQLite.

Any changes to Connect (registering users, publishing content, etc) will be persisted between sessions. To wipe all content, run `make clean`.


