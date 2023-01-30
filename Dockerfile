FROM python:3.10-slim-buster as runner

# set work directory
WORKDIR /app

# python environment variables
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONUTF8=1 \
    PYTHONIOENCODING=UTF-8 \
    PIP_DISABLE_PIP_VERSION_CHECK=on

# install nodejs
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN apt-get update &&\
    apt-get install -y --no-install-recommends \
    curl \
    unzip &&\
    apt-get clean &&\
    rm -rf /var/lib/apt/lists/* &&\
    curl -fsSL https://deb.nodesource.com/setup_16.x | bash - &&\
    apt-get update && \
    apt-get install -y --no-install-recommends\
    nodejs &&\
    apt-get clean &&\
    rm -rf /var/lib/apt/lists/*

# copy requirements.txt
COPY requirements.txt* ./

# install pip dependencies
RUN pip install --no-cache-dir -U pip  &&\
    pip install --no-cache-dir -U setuptools  && \
    pip install --no-cache-dir -U wheel  && \
    pip install --no-cache-dir -r requirements.txt

# permission settings
RUN groupadd -r app && useradd -r -m -g app app
RUN chown -R app:app /app
USER app

# copy source code
COPY --chown=app:app . ./

# init pynecone
RUN pc init

# start process
ENTRYPOINT ["pc", "run"]
