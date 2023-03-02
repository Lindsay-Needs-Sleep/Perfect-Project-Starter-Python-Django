# Perfect Project Starter for Python (Django)

## Adopt this for your project

Replace all instances of the following the project:
* `longprojectname` with `<longer-project-name>` (could collide with other projects)
* `shortprojectname` with `<name>`
* `pythoncodefolder` with the relative path to where your python code is/will be (relative to the project root)
    * Put your python code in this folder
    * NOTE: If you don't have existing code yet, add at least 1 dummy file to this folder otherwise docker will mess up the permissions on this folder for some reason -.-)

Simplify/Update the following as required for your project (Currently set up for django project with a postgresql DB)
* `docker/docker-compose.*.yml` files
* `start.sh` currently produces different django start commands based on environment variables
* `.vscode/tasks.shared.json`
* `.vscode/launch.shared.json`
* `.editorconfig`

Continue through the rest of the setup steps until you get to `bash ./start.sh`.
Before running `start.sh` you should have code in your `pythoncodefolder` and you should modify `start.sh` to suit your needs.
> To interactively initialize your code in the container with it's exact environment, `cd docker && docker compose run python /bin/bash` and then do your thing.
>
> **django**
> ```bash
> python -m pip install Django==4.1.7
> mkdir settings
> django-admin startproject settings .
> python -m pip freeze > requirements.txt
> # Add an app
> mkdir apps
> mkdir apps/myapp
> python manage.py startapp myapp ./apps/myapp
> # Add "psycopg2==2.9.5" to generated requirements.txt (for postgresql)
> ```

Run `bash ./start.sh` and finish following the setup

Update the README Title, and (probably) nuke this "Adopt this for your project" section.

## Setup and run

### #01 - Dependencies

Install Docker (and docker compose)
* (dev) [Docker Desktop](https://www.docker.com/products/docker-desktop/)
    * (windows) should use WSL2 engine
* (prod)

### #02 - IDE setup

**VsCode with Dev Containers (v1.74.3) (Recommended)**

This option will automaitcally include all development dependencies, extension recomendations, debug and run configs

> Install the [Dev Containers Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)(v0.266.1)
> * It should ask if you want to "Reopen in Container", say yes. (Otherwise, click on the bottom left corner (green square), `Reopen in Container (Dev Container)`)

**VsCode local & Other IDEs**

With this option you are in charge of installing and configuring all dependancies/extensions correctly

> Install Python 3.11
>
> To ensure docker runs with the correct user you must have the following environment variables set or hard-coded to `docker/.env` (may have to create the file)
> * `CURRENT_HOST_USER_UID=$(id -u)`
> * `CURRENT_HOST_USER_GID=$(id -g)`
>
> Install extensions:
> * EditorConfig (recommended) [[vscode](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig)]
> * Docker (optional) [[vscode](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)]
> * VsCode only
>   * WorkSpace Config Plus (recommended) [[vscode](https://marketplace.visualstudio.com/items?itemName=swellaby.workspace-config-plus)]

### #03 - Setup and Run Project

Run initial setup script (safe to rerun)
* (dev) `bash ./setup-dev.sh`
* (prod) `bash ./setup-prod.sh`

Fill out the following files as appropriate
* `/docker/docker-compose.override.yml`
* (dev) (vscode only) `.devcontainer/user-installs.sh`
    * Note: You should refresh the dev container **now** and any time you update `.devcontainer/user-installs.sh`
        * `ctrl + shift + P` > `Dev Containers: Rebuild Container` for a completely fresh re-application
        * Or re-run the file directly for a quick and dirty update `bash .devcontainer/user-installs.sh`
* (dev) (vscode only) `.vscode/settings.local.json`

Run `bash ./start.sh`
* (dev) Set environment variables as desired (for `start.sh`):
    * START_SH_DEBUG=true if you want to debug
    * START_SH_DEBUG_WAIT=true if want the program to wait until a debugger is attached
