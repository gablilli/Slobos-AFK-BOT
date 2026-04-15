FROM node:22

# Installiamo TUTTE le dipendenze necessarie per compilare moduli nativi (canvas)
RUN apt-get update && apt-get install -y \
    build-essential \
    python3 \
    pkg-config \
    libcairo2-dev \
    libpango1.0-dev \
    libjpeg-dev \
    libgif-dev \
    librsvg2-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copia i file di configurazione
COPY package*.json ./

# Forza la compilazione da zero dei moduli nativi
RUN npm install --build-from-source

# Copia il resto del codice
COPY . .

# Espone la porta del viewer (Aternos richiede spesso la 3000 o 8080)
EXPOSE 3000

CMD ["node", "index.js"]
