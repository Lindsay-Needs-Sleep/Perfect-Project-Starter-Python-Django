# Perfect Project Starter for Python (Django)

## Adopt this for your project

Replace all instances of the following the project:
* `longprojectname` with `<longer-project-name>` (could collide with other projects)
* `shortprojectname` with `<name>`
* `back_src` with the relative path to where your python code is/will be (relative to the project root)
    * Put your python code in this folder
    * You must have at least an empty `requirements.txt` file
        * NOTE: If you don't have any files in this folder docker will mess up the permissions on this folder for some reason -.-)

Simplify/Update the following as required for your project (Currently set up for django project with a postgresql DB)
* `docker/docker-compose.*.yml` files
* `backend-start.sh` currently produces different django start commands based on environment variables
* `.vscode/launch.shared.json`
* `.editorconfig`
* `backend-start.sh`
* `components-start.sh`

If you need to interactively initialize your code in the container with it's exact environment...
* Do steps #01 and #02 of [setup-and-run](#setup-and-run)
* Run `./setup-dev.sh`
* If you're starting a new project, run `./backend-start.sh i`
    * **django**
        ```bash
        python -m pip install Django==4.1.7
        django-admin startproject zzz_config_zzz .
        # Next line for postgresql
        python -m pip install psycopg2==2.9.5
        python -m pip freeze > requirements.txt
        # Add an app
        python manage.py startapp myapp
        python manage.py makemigrations myapp
        python manage.py migrate
        # Create admin panel super user
        python manage.py createsuperuser
        ```

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
> * Sadly [WorkSpace Config Plus](https://marketplace.visualstudio.com/items?itemName=swellaby.workspace-config-plus) [doesn't work in devconatiners](https://github.com/swellaby/vscode-workspace-config-plus/issues/121), so you will either have to manually create `lauch.json` and `settings.json`, or outside of the devcontainer, open the folder and install the plugin.

**VsCode local & Other IDEs**

With this option you are in charge of installing and configuring all dependancies/extensions correctly

> Install Python 3.11
>
> Install extensions:
> * EditorConfig (recommended) [[vscode](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig)]
> * Docker (optional) [[vscode](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)]
> * VsCode only
>   * WorkSpace Config Plus (recommended) [[vscode](https://marketplace.visualstudio.com/items?itemName=swellaby.workspace-config-plus)]
>
> VsCode only:
> * Create `.vscode/launch.local.json` from a copy of `.vscode/launch.shared.json`, delete all keys except `"name"` and `"host"` and set the `"host"` value to `"localhost"`. (This should result in `"host": "localhost"` in launch.json )

### #03 - Setup and Run Project

```bash
# Register commit hooks
git config core.hooksPath git_hooks
```

Run initial setup script (safe to rerun)
* (dev) `./setup-dev.sh`
* (prod) `./setup-prod.sh`

Fill out the following files as appropriate
* `/docker/docker-compose.override.yml`
* `/back_src/zz_config_zzz/settings_local.py`
    * Set `DEBUG=True`
    * Other settings as desired
* (dev) (vscode only) `.devcontainer/user-installs.sh`
    * Note: You should refresh the dev container **now** and any time you update `.devcontainer/user-installs.sh`
        * `ctrl + shift + P` > `Dev Containers: Rebuild Container` for a completely fresh re-application
        * Or re-run the file directly for a quick and dirty update `bash .devcontainer/user-installs.sh`
* (dev) (vscode only) `.vscode/settings.local.json`

Front end developement:
* Run `./components-start.sh` (see file for options)
* visit http://localhost:8347/ to develop components

Back-end and integrated front-end development:
* Run `./backend-start.sh` (see file for options)
* visit http://localhost:8080/
* Don't forget to disable browser caching in chrome devtools when developing.

### #04 - Additional Notes

If `requirements.txt` changes you should rebuild the image
```bash
docker compose build python
```

