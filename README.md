# Boilerplate for Twilio Flex

## Requirements

- [🦬 make](https://www.gnu.org/software/make/)
- [🐳 docker](https://www.docker.com/)
- [🐳 docker compose](https://docs.docker.com/compose/)

Copy `.env.sample` to `.env` and set your variables 📝

## How does it work

This project is built with docker compose and make. You can run the commands directly with npm but **it is highly recommended to use `make` with `docker compose`** because you make sure to run it with the same version. `Make` raises the container with docker compose, executes the task and removes the container, in this way the local machine is clean once you execute the commands.

## Env vars

- **PLUGIN_NAME:** This variable is used to set the project name for the plugin. It has to start as `plugin-`

- **USERNAME, USER_ID and GROUP_ID:** Docker use, by default, the root user. When you run all the commands inside docker (for example create directories) the permissions is setted as root and you can't change the content of the file without root permissions. To avoid this set this variables with the values from your host system

- **TWILIO_ACCOUNT_SID, TWILIO_API_KEY, TWILIO_API_SECRET, TWILIO_AUTH_TOKEN:** You have two options for authenticating to Twilio:
    - With token: in this case you only need to fill TWILIO_ACCOUNT_SID and TWILIO_AUTH_TOKEN.
    - With api key: in this case you need to fill TWILIO_ACCOUNT_SID, TWILIO_API_KEY and TWILIO_API_SECRET. (This is the recommended by Twilio)

## Create plugin project

First of all ensure you have the `.env` file. If not copy the `.env.sample` to `.env` and fill the variables you need. 

```sh
make twilio/flex/plugin/create
```

After this ensure to install the dependencies with the command:

```sh
make plugin/install
```

That's all! Easy. 🚀

## Commands

### Twilio commands

- See twilio version
```sh
make twilio/version
```

### Twilio flex plugin commands

- Show commands to flex plugin
```sh
make twilio/flex/plugin/help
```

- Create the plugin project with typescript (with the name you put in env var `PLUGIN_NAME`)
```sh
make twilio/flex/plugin/create
```

- Create js and sourcemap bundle
```sh
make twilio/flex/plugin/build
```

- Start a dev server
```sh
make twilio/flex/plugin/start
```

- Build and deploy a new version to your flex application
```sh
make twilio/flex/plugin/deploy
```

- Run the test suite
```sh
make twilio/flex/plugin/test
```

### Project commands

- Install project dependencies
```sh
make plugin/install
```

- Install react as dependency
```sh
make plugin/install deps="react"
```

- Install typescript as dev dependency
```sh
make plugin/install deps="-D typescript"
```

- Run postinstall script from package.json
```sh
make plugin/postinstall
```
