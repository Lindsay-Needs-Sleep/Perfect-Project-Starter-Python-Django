# Perfect Project Starter for Python (Django)

## Adopt this for your project

Replace all instances of `projectname` with `<projectname>` (could collide with other projects)

Run the commands below
```bash
# Create uncommitted files from examples (if they don't already exist)
cp -n ./docker/docker-compose.dev.override.example.yml ./docker/docker-compose.override.yml
cp -n .devcontainer/user-installs.example.sh .devcontainer/user-installs.sh
cp -n .vscode/settings.local.example.json .vscode/settings.local.json
```

Simplify/Update the following as required for your project (Currently set up for django project with a postgresql DB)

* `docker/docker-compose.*.yml` files
* `.editorconfig`
* `shared_volume/eslint.config.mjs`
* `backend-start.sh` `components-start.sh` `node-start.sh`

Update the README Title, and (probably) nuke this "Adopt this for your project" section.

## Setup and run

### #01 - Dependencies

Install Docker (and docker compose)

* (dev) [Docker Desktop](https://www.docker.com/products/docker-desktop/)
    * (windows) should use WSL2 engine
* (prod)

### #02 - IDE setup

**VsCode - Step 1**

* update `.vscode/*.json` files
    * `*.local.json` are uncommitted, while `*.shared.json` are committed
    * The local and shared version will be automatically merged by the plugin below
* Install [WorkSpace Config Plus](https://marketplace.visualstudio.com/items?itemName=swellaby.workspace-config-plus)
    * Note: [it doesn't work in devconatiners yet](https://github.com/swellaby/vscode-workspace-config-plus/issues/121)

**VsCode - Step 2 [Option 1 - w/ Dev Container (v1.74.3) (Recommended)]**

This option will automaitcally include all development dependencies, extension recomendations, debug and run configs

Fill out `.devcontainer/user-installs.sh` to customize your dev container env

* Note: After you have started the dev container (in a few steps) you will need to refresh the dev container any time you update `.devcontainer/user-installs.sh`
    * `ctrl + shift + P` > `Dev Containers: Rebuild Container` for a completely fresh re-application
    * Or re-run the file directly for a quick and dirty update `bash .devcontainer/user-installs.sh`

Install the [Dev Containers Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)(v0.266.1)

* It should ask if you want to "Reopen in Container", say yes. (Otherwise, click on the bottom left corner (green square), `Reopen in Container (Dev Container)`)

**Other IDEs** or **VsCode - Step 2 [Option 2 - w/o Dev Container]**

With this option you are in charge of installing and configuring all dependancies/extensions correctly

* Install Python 3.11
* Install extensions:
    * EditorConfig (recommended) [[vscode](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig)]
    * Docker (optional) [[vscode](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)]

### #03 - Setup Project

```bash
# Register commit hooks
git config core.hooksPath git_hooks
```

Run initial setup script (safe to rerun)

* (dev) `./setup-dev.sh`
* (prod) `./setup-prod.sh`

Check later sections for more details on working with certain projects

### #04 Run Project

Each project has it's `run-*.sh <option>` file. Some projects have unique options (eg. django has `mm` for `makemigrations`), see the file for all available options and more details.

Common options are:

* <none> (default) - run program (debugging enabled)
* w - run program and wait debugger to attach
* p - run production program
* t - test (debugging enabled)
* tw - test and wait debugger to attach
* s - autofix some styles and style check
* st - style check and test
* i - interactive (get into the projgram's docker container)


### 05 Additional Project Setup

**Django / Python**:

Notes:

* Put your python code in `django_src`
* You must have at least an empty `requirements.txt` file
    * NOTE: If you don't have any files in this folder docker will mess up the permissions on this folder for some reason -.-)
* If `requirements.txt` changes you should rebuild the image
    * `docker compose build python`
* When running, visit http://localhost:8080/
    * Don't forget to disable browser caching in chrome devtools when developing.

Fill out the following files as appropriate:

* `/django_src/zz_config_zzz/settings_local.py`
    * Set `DEBUG=True`
    * Other settings as desired

If you need to interactively initialize your python code, run
```bash
./backend-start.sh i
```
Then you can run commands like these (this is an example for initializing a django/postgres project):
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
# finsihed
exit
```
