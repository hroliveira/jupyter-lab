FROM python:3.11-slim

ENV DEBIAN_FRONTEND=noninteractive
ENV PATH="/home/jupyter/.local/bin:$PATH" 

# Dependências de sistema + node
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    build-essential \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

# Cria usuário não-root
RUN useradd -ms /bin/bash jupyter
USER jupyter
WORKDIR /home/jupyter

# Copia e instala dependências Python
COPY --chown=jupyter:jupyter requirements.txt .

# Instala como usuário com --user (evita acesso root e conflitos)
RUN pip install --no-cache-dir --user -r requirements.txt \
 && pip install --no-cache-dir --user jupyterlab

# Cria diretório de trabalho para os notebooks
RUN mkdir -p /home/jupyter/workspace
WORKDIR /home/jupyter/workspace

# Porta padrão do Jupyter
EXPOSE 8888

# Comando de inicialização
CMD ["sh", "-c", "jupyter-lab --ip=0.0.0.0 --port=8888 --no-browser --NotebookApp.token='' --NotebookApp.password=${JUPYTER_PASSWORD}"]
