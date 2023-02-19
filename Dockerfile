# Stage 1
FROM node:18-alpine as node
WORKDIR /app
COPY . .
RUN npm install --force
RUN npm run build-prod

# Stage 2
FROM nginx:alpine
COPY --from=node /app/dist/Conges-front /usr/share/nginx/html
