
### Create Multi Stage Dockerfile ###
#1. Clone the code rpository from github: git clone https://github.com/shawon100/Angular-CRUD 
#2. Create the Docker file scrip ###

# Stage 1: For Build
FROM node:8.9-alpine AS Build
WORKDIR /usr/src/app
COPY . /usr/src/app
RUN npm install
RUN npm run Build

# Stage 2: For Run
FROM nginx:1.17.1-alpine
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=Build /usr/src/app/dist/crud /usr/share/nginx/html

