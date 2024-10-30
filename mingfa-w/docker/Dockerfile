ARG BASE_IMAGE=nvcr.io/nvidia/cuda:12.5.1-devel-ubuntu20.04
FROM ${BASE_IMAGE}

RUN echo "root:8uhb9ijn" | chpasswd
EXPOSE 22

ARG APPS_PATH=/opt/apps
ARG CODE_PATH=${APPS_PATH}/code
ARG VENV_PATH=${APPS_PATH}/venv

RUN apt-get update && apt-get -y --no-install-recommends install \
    wget \
    git \
    clang lld ninja-build ccache libssl-dev \
    vim \
    build-essential \
    python3-dev python3-pip python3-venv \
    sudo \
    iputils-ping \
    net-tools \
    openssh-client \
    openssh-server \
    gdb \
    tree \
    > /dev/null && \
    apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists

# install cmake
RUN mkdir /tmp/cmake && cd /tmp/cmake && \
	wget https://cmake.org/files/v3.20/cmake-3.20.0.tar.gz && \
	tar -zxvf cmake-3.20.0.tar.gz && \
	cd cmake-3.20.0 && \
    ./configure && make -j$(nproc) && make install && \
    rm -rf /tmp/cmake

# install llvm for triton-x
ARG LLVM_INSTALL_PATH=${APPS_PATH}/llvm_triton-d39ee1f9-llvm-61f8a7f6
RUN mkdir /tmp/llvm && cd /tmp/llvm && \
    git clone -b mingfa-w/triton-d39ee1f9-llvm-61f8a7f6 https://github.com/mingfa-w/llvm-project.git && \
    cd llvm-project && \
    bash mingfa-w/build.sh -p ${LLVM_INSTALL_PATH} -r && \
    rm -rf /tmp/llvm

# install llvm for triton-shared
ARG LLVM_INSTALL_PATH=${APPS_PATH}/llvm_triton-31040564-llvm-c08c6a71
RUN mkdir /tmp/llvm && cd /tmp/llvm && \
    git clone -b mingfa-w/triton-31040564-llvm-c08c6a71 https://github.com/mingfa-w/llvm-project.git && \
    cd llvm-project && \
    bash mingfa-w/build.sh -p ${LLVM_INSTALL_PATH} -r && \
    rm -rf /tmp/llvm

# install llvm for triton-linalg
ARG LLVM_INSTALL_PATH=${APPS_PATH}/llvm_triton-e601be5d-llvm-10dc3a8e
RUN mkdir /tmp/llvm && cd /tmp/llvm && \
    git clone -b mingfa-w/triton-e601be5d-llvm-10dc3a8e https://github.com/mingfa-w/llvm-project.git && \
    cd llvm-project && \
    bash mingfa-w/build.sh -p ${LLVM_INSTALL_PATH} -r && \
    rm -rf /tmp/llvm

# install conda, 并创建一个python 3.12.4的虚拟环境
ARG CONDA_PATH=${APPS_PATH}/miniconda3
RUN mkdir -p ${CONDA_PATH} && cd ${CONDA_PATH} && \
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ${CONDA_PATH}/miniconda.sh && \
    bash ${CONDA_PATH}/miniconda.sh -b -u -p ${CONDA_PATH} && \
    rm ${CONDA_PATH}/miniconda.sh && \
    ${CONDA_PATH}/bin/conda create -n triton-py3124 python=3.12.4

# create python venv for triton-x
ARG PY3_TRITON_X=${VENV_PATH}/triton-x
RUN ${CONDA_PATH}/envs/triton-py3124/bin/python -m venv ${PY3_TRITON_X} && \
    ${PY3_TRITON_X}/bin/pip install --upgrade pip && \
    ${PY3_TRITON_X}/bin/pip3 install wheel setuptools ninja wheel pybind11 torch numpy scipy pytest lit pandas matplotlib && \
    chmod 777 -R ${PY3_TRITON_X}

# build triton-x
ENV PATH=${PY3_TRITON_X}/bin:$PATH
ENV PATH=${PY3_TRITON_X}/bin/activate:$PATH
RUN . ${PY3_TRITON_X}/bin/activate

RUN mkdir -p ${CODE_PATH} && cd ${CODE_PATH} && \
    git clone git@code.byted.org:seed/triton-x.git && \
    cd triton-x && \
    bash utils/script/build-triton-x.sh

# create python venv for py3-triton-shared
ARG PY3_TRITON_SHARED=${VENV_PATH}/triton-shared
RUN ${CONDA_PATH}/envs/triton-py3124/bin/python -m venv ${PY3_TRITON_SHARED} && \
    ${PY3_TRITON_SHARED}/bin/pip install --upgrade pip && \
    ${PY3_TRITON_SHARED}/bin/pip3 install wheel setuptools ninja wheel pybind11 torch numpy scipy pytest lit pandas matplotlib && \
    chmod 777 -R ${PY3_TRITON_SHARED}

# build triton-shared
ENV PATH=${PY3_TRITON_SHARED}/bin:$PATH
ENV PATH=${PY3_TRITON_SHARED}/bin/activate:$PATH
RUN . ${PY3_TRITON_SHARED}/bin/activate

RUN mkdir -p ${CODE_PATH} && cd ${CODE_PATH} && \
    git clone --recurse-submodules -b mingfa-w/5bd61a02 https://github.com/mingfa-w/triton-shared.git && \
    cd triton-shared && \
    bash mingfa-w/build.sh

# create python venv for py3-triton-linalg
ARG PY3_TRITON_LINALG=${VENV_PATH}/triton-linalg
RUN ${CONDA_PATH}/envs/triton-py3124/bin/python -m venv ${PY3_TRITON_LINALG} && \
    ${PY3_TRITON_LINALG}/bin/pip install --upgrade pip && \
    ${PY3_TRITON_LINALG}/bin/pip3 install wheel setuptools ninja wheel pybind11 torch numpy scipy pytest lit pandas matplotlib && \
    chmod 777 -R ${PY3_TRITON_LINALG}

# build triton-linalg
ENV PATH=${PY3_TRITON_LINALG}/bin:$PATH
ENV PATH=${PY3_TRITON_LINALG}/bin/activate:$PATH
RUN . ${PY3_TRITON_LINALG}/bin/activate

RUN mkdir -p ${CODE_PATH} && cd ${CODE_PATH} && \
    git clone --recurse-submodules -b mingfa-w/e601be5d https://github.com/mingfa-w/triton-linalg.git && \
    cd triton-linalg && \
    bash mingfa-w/build.sh

# 设置SSH无密码登录（如果需要）
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    mkdir -p /var/run/sshd

# 设置sshd自启动
CMD ["/usr/sbin/sshd", "-D"]
WORKDIR /host
# ENTRYPOINT ["/bin/bash"]
