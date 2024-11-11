FROM node:16-bullseye-slim

# Instalar dependencias necesarias
RUN apt-get update && \
    apt-get install -y git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Clonar repositorio de Excalidraw
RUN git clone https://github.com/excalidraw/excalidraw.git /excalidraw

# Establecer directorio de trabajo
WORKDIR /excalidraw

# Instalar dependencias
RUN yarn install --frozen-lockfile

# Construir la aplicación
RUN yarn build

# Exponer puerto 80
EXPOSE 80

# Configurar variables de entorno
ENV NODE_ENV=production
ENV PORT=80

# Comando para iniciar la aplicación
CMD ["yarn", "start"]
