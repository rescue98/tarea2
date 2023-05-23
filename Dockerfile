FROM node:16-alpine
WORKDIR /usr/app
COPY  . . 
EXPOSE 8081
RUN apk add --no-cache --update python3 && \
    npm install
ENTRYPOINT [ "npm","run","dev"]
