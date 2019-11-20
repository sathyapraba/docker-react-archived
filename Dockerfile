# builder phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# run phase
FROM nginx 
#copy from builder phase
COPY --from=builder /app/build /usr/share/nginx/html
