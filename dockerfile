# Usa la imagen base de Node.js
FROM node:20-alpine3.16

# # Configura PNPM
# ENV PNPM_HOME="/pnpm"
# ENV PATH="$PNPM_HOME:$PATH"
# RUN corepack enable

# # Establece el directorio de trabajo
# WORKDIR /core-Ecommerce

# # Copia los archivos de dependencias primero (mejora la caché)
# COPY package.json pnpm-lock.yaml ./

# # Instala dependencias
# RUN pnpm install

# # Copia el resto del proyecto
# COPY . .

# # Abre el puerto de la aplicación
# EXPOSE 3000

# # Comando para ejecutar en modo desarrollo
# CMD ["pnpm", "start"]

# Crea el directorio de la aplicación
WORKDIR /core-Ecommerce

# Copia package.json y pnpm-lock.yaml
COPY package.json pnpm-lock.yaml ./

# Instala las dependencias
RUN corepack enable && pnpm install

# Copia el resto de los archivos
COPY . .

# Construye la aplicación
RUN pnpm build

# Exponer el puerto y definir el comando de inicio
EXPOSE 3000
CMD ["pnpm", "start"]