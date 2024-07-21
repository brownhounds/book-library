FROM node:20-alpine AS builder

RUN mkdir /app

WORKDIR /app

COPY . .

RUN npm ci

RUN npm run build

FROM brownhounds/go-static:latest

COPY --from=builder /app/dist /app

ENTRYPOINT ["/go/bin/server"]
