FROM python:3.11.2

# User root user to create a non-root user so we can install pip packages without root
USER root

# Install as root to a global location so it doesn't get saved to requirements.txt with pip freeze
ARG DEV_BUILD
RUN [ -z "$DEV_BUILD" ] || pip install --target=/usr/local/python debugpy==1.6.6
RUN [ -z "$DEV_BUILD" ] || pip install --target=/usr/local/python pycodestyle==2.10.0
RUN [ -z "$DEV_BUILD" ] || pip install --target=/usr/local/python autopep8==2.0.2

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

COPY back_src/requirements.txt .
RUN pip install --user -r requirements.txt
