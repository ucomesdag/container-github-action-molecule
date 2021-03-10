FROM quay.io/podman/stable:latest

ARG PYTHON_VERSIONS="3.10 3.11 3.12"
ARG BUILD_DATE

LABEL summary="A container that is used for GitHub actions molecule."
LABEL maintainer="Uco Mesdag <uco@mesd.ag>"
LABEL build-date=${BUILD_DATE}

ENV container=podman

WORKDIR /github/workspace

RUN dnf -y update; \
    dnf -y install which \
                   gcc \
                   git-core \
                   ncurses-devel \
                   openssl-devel \
                   bzip2-devel \
                   sqlite-devel \
                   zlib-devel \
                   xz-devel \
                   libffi-devel \
                   readline-devel; \
    dnf clean all; \
    rm -rf /var/cache /var/log/dnf* /var/log/yum.*

RUN echo -e '\ 
export PYENV_ROOT="$HOME/.pyenv" \n\
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH" \n\
eval "$(pyenv init -)" \n\
eval "$(pyenv virtualenv-init -)" \n\
' >> $HOME/.bashrc

RUN curl https://pyenv.run | bash; \
    source $HOME/.bashrc; \
    pyenv install ${PYTHON_VERSIONS}; \
    pyenv global ${PYTHON_VERSIONS##* }; \
    pip install tox virtualenv-pyenv podman molecule molecule-plugins[podman] testinfra ansible-later ansible-lint yamllint

# set UTC namespace to private to allow setting the hostname
RUN sed -i -e 's|^utsns="host"|utsns="private"|g' /etc/containers/containers.conf

CMD source $HOME/.bashrc; function retry { counter=0 ; until "$@" ; do exit=$? ; counter=$(($counter + 1)) ; if [ $counter -ge ${max_failures:-3} ] ; then return $exit ; fi ; done ; return 0; } ; cd ${GITHUB_REPOSITORY:-.} ; if [ -f tox.ini -a ${command:-test} = test ] ; then retry tox ${options} ; else PY_COLORS=1 ANSIBLE_FORCE_COLOR=1 retry molecule ${command:-test} --scenario-name ${scenario:-default}; fi
