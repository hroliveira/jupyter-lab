<img width=100% src="https://capsule-render.vercel.app/api?type=waving&color=1a2e50&height=120&section=header"/>

# 🧪 JupyterLab Custom - Docker Image

![Docker](https://img.shields.io/docker/pulls/oliveirahr/jupyter-lab-custom)
![Build](https://img.shields.io/badge/status-stable-brightgreen)

Imagem Docker personalizada do **JupyterLab**, com bibliotecas para ciência de dados, gráficos, dados financeiros, machine learning e várias extensões úteis para produtividade e visualização.

---

## 📦 Bibliotecas incluídas

- `pandas`, `matplotlib`, `seaborn`, `plotly`, `openpyxl`
- `yfinance` (dados de mercado financeiro)
- `scikit-learn`, `ipywidgets`, `voila`
- `notebook`, `ipython`

---

## 🔌 Extensões JupyterLab incluídas

| Extensão                         | Função                                                       |
|----------------------------------|--------------------------------------------------------------|
| `jupyterlab-lsp`                 | Autocompletar, hover, goto definition (VS Code-like)         |
| `jupyterlab-git`                 | Integração visual com Git                                    |
| `jupyterlab-drawio`              | Criação de diagramas estilo draw.io                          |
| `jupyterlab-filetree`            | Visualização de árvore de arquivos                           |
| `jupyterlab-system-monitor`      | Monitor de CPU/RAM em tempo real                             |
| `lckr-jupyterlab-variableinspector` | Inspeciona variáveis em tempo real nos notebooks         |
| `nbdime`                         | Comparação visual entre notebooks                            |

---

## 🚀 Como usar

### 🔒 1. Gere o hash da senha

```bash
python3 -c "from notebook.auth import passwd; print(passwd('minhasenha', algorithm='argon2'))"
```

---

### 🐳 2. Docker (modo simples)

```bash
docker run -it --rm -p 8888:8888 \
  -e JUPYTER_PASSWORD='argon2:...' \
  oliveirahr/jupyter-lab-custom:latest
```

Acesse em: [http://localhost:8888](http://localhost:8888)

---

### 🐙 3. Docker Compose (com volume local)

**docker-compose.yml:**

```yaml
version: '3.8'

services:
  jupyterlab:
    image: oliveirahr/jupyter-lab-custom:latest
    container_name: jupyterlab
    ports:
      - "8888:8888"
    environment:
      - JUPYTER_PASSWORD=argon2:...seu_hash...
    volumes:
      - ./notebooks:/home/jupyter/workspace
    restart: unless-stopped
```

---

## 🛡️ Segurança

- Sem token de URL, acesso por senha.
- Sem root no container.
- Diretório `workspace` isolado com volume Docker ou local.

---

## 🧩 Dashboards com Voila

Acesse notebooks como dashboards:

```
http://localhost:8888/voila/render/seu_notebook.ipynb
```

---

## 📁 Dados persistentes

- Volume padrão: `./notebooks` (ou nomeado via Docker volume)
- Caminho dentro do container: `/home/jupyter/workspace`

---

## 📃 Licença

MIT License.

<img width=100% src="https://capsule-render.vercel.app/api?type=waving&color=1a2e50&height=120&section=footer"/>