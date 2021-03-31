# selecciona la imagen base para construir la nueva imagen
FROM node:14.16

# Comando a ejecutar para la creación de la imagen
# Crea este directorio solo si no existe (-p)
RUN mkdir -p /usr/src/app

# Define el directorio de trabajo predeterminado
# Los comandos dentro de CMD se ejecutarán en este directorio
WORKDIR /usr/src/app

# Copia todos los archivos package que acaben con .json
# (package.json, package-lock.json) al WORKDIR
# COPY archivo_a_copiar directorio_destino
COPY package*.json ./

# Comando a ejecutar para la creación de la imagen
RUN npm install

# Copia los archivos al WORKDIR
# COPY archivo_a_copiar directorio_destino
COPY . .

# Define qué puertos del contenedor exponer
EXPOSE 3000

# Comandos a ejecutar cuando se lance la imagen construida
# Se ejecutarán dentro del WORKDIR

# 1. for one command
# CMD [ "npm", "start" ]

# 2. for many commands with && (start)
# CMD npm run build && npm start

# 3. dev
# CMD npm run dev
CMD [ "npm", "run", "dev" ]