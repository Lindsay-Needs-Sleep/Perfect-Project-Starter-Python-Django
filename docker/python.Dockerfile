FROM python:3.11.2

# User root user to create a non-root user so we can install pip packages without root
USER root

# Install as root to a global location so it doesn't get saved to requirements.txt with pip freeze
ARG DEBUG
RUN [ -z "$DEBUG" ] || pip install --target=/usr/local/python debugpy==1.6.6

ARG USER_UID
ARG USER_GID
ARG USERNAME

RUN groupadd -g ${USER_GID} ${USERNAME}
# for whatever reason the /home/username directory is not created with useradd :/
# RUN useradd -u ${USER_UID} --gid ${USER_GID} ${USERNAME}
RUN adduser --uid ${USER_UID} --gid ${USER_GID} --disabled-password ${USERNAME}

# Switch to our non-root user
USER ${USERNAME}
ENV PATH="$PATH:/home/${USERNAME}/.local/bin"

COPY pythoncodefolder/requirements.txt .
RUN pip install --user -r requirements.txt
