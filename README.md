# pynecone-template

template to use [pynecone](https://github.com/pynecone-io/pynecone) more efficiently.
## Run Locally

Crate repository from template and clone

```bash
  git clone https://github.com/{your_name}/{repo_name}
```

Go to the project directory

```bash
  cd {repo_name}
```

Install pynecone dependencies from [here](https://pynecone.io/docs/getting-started/installation)

if you have not installed [poetry](https://github.com/python-poetry/poetry), please install.

Install dependencies use poetry

```bash
poetry install && poetry update
```

Start the Server

```bash
poe up
```
## Run on Docker with docker-compose

```bash
docker compose up -d --build
```
