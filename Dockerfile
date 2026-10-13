FROM node:22-alpine AS builder

WORKDIR /app

COPY package*.json ./

RUN npm ci

COPY . .

ARG BUILD_AREA=training

RUN VITE_BUILD_AREA="$BUILD_AREA" npm run build

FROM nginx:alpine AS runtime

ARG COMMIT=unknown
LABEL org.opencontainers.image.revision="${COMMIT}"

ARG BUILD_AREA=training
LABEL lab.area="${BUILD_AREA}"

COPY --from=builder /app/dist /usr/share/nginx/html