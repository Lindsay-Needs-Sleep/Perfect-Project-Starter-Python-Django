# Perfect Project Starter for Python (Django)

## Adopt for your project

* Replace all `longprojectname` with `<longer-project-name>` (could collide with other projects), and all `shortprojectname` with `<name>`, and `pythoncodefolder` with the relative path to where your python code is/will be (ensure the folder exists)
* Simplify/Update the following as required for your project (Currently set up for django project with a postgresql DB)
    * `docker/docker-compose.*.yml` files
    * `start.sh` currently produces different django start commands based on environment variables
    * `.vscode/tasks.shared.json`
    * `.vscode/launch.shared.json`
    * `.editorconfig`
* Continue through the rest of the setup steps until you get to `bash ./start.sh`. Before running this we should initialize/create our django/python code.
    * Either copy existing code into your `pythoncodefolder` (renamed)
    * Or, to interactively initialize your code in the container (with it's exact environment): `docker compose run python /bin/bash` and then do your thing.  NOTE: windows users should run this from windows, not wsl (otherwise created files have permission issues).
        * django
        ```bash
        python -m pip install Django==4.1.7
        mkdir settings
        django-admin startproject settings ./settings
        python -m pip freeze > requirements.txt
        # Add an app
        mkdir apps
        mkdir apps/myapp
        python manage.py startapp myapp ./apps/myapp
        ```
        Add `psycopg2==2.9.5` to generated requirements.txt (for postgresql)
* Finish following the setup
* Update Readme Title, and (probably) nuke this TODO section.

## Setup and run

### 01 Dependencies

* Install Docker (and docker compose)
    * (dev) [Docker Desktop](https://www.docker.com/products/docker-desktop/)
        * (windows) should use WSL2 engine
    * (prod)

### 02 IDE setup

#### VsCode with Dev Containers (v1.74.3) (Recommended)

This option will automaitcally include all development dependencies, extension recomendations, debug and run configs

* Install the [Dev Containers Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)(v0.266.1)
* It should ask if you want to "Reopen in Container", say yes
    * Else, click on the bottom left corner (green square), `Reopen in Container (Dev Container)`

#### VsCode local & Other IDEs

* Install Python 3.11
* To ensure docker runs with the correct user, `CURRENT_HOST_USER=$(id -u):$(id -g)` must be set, alternatively, you can hard-code the result to `docker/.env` (may have to create the file)
* Install extensions:
    * EditorConfig (recommended) [[vscode](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig)]
    * (vscode only) WorkSpace Config Plus (recommended) [[vscode](https://marketplace.visualstudio.com/items?itemName=swellaby.workspace-config-plus)]
    * Docker (optional) [[vscode](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)]



### 03 Setup and Run Project

* Run initial setup script (safe to rerun)
    * (dev) `bash ./setup-dev.sh`
    * (prod) `bash ./setup-prod.sh`
* Fill out the following files as appropriate
    * `/docker/docker-compose.override.yml`
    * (dev) (vscode only) `.devcontainer/user-installs.sh`
        * Note: If you make changes to `.devcontainer/user-installs.sh` you can either re-run the file directly from within your dev container (`bash .devcontainer/user-installs.sh`) or `ctrl + shift + P` > `Dev Containers: Rebuild Container` for a fresh re-application
    * (dev) (vscode only) `.vscode/settings.local.json`
* `bash ./start.sh`
    * (dev) Set environment variables as desired (for `start.sh`):
        * START_SH_DEBUG=true if you want to debug
        * START_SH_DEBUG_WAIT=true if want the program to wait until a debugger is attached


```
git config core.hooksPath hooks
```


