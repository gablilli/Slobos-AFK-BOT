FROM node:22-bookworm
# cache-bust: 2026-04-18-v3.2
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    python3 \
    pkg-config \
    libcairo2-dev \
    libpango1.0-dev \
    libjpeg-dev \
    libgif-dev \
    librsvg2-dev \
    libpixman-1-dev \
    libx11-dev \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY package*.json ./
RUN npm install --force --no-cache
COPY . .
EXPOSE 3000
EXPOSE 3001
CMD ["node", "index.js"]
