From node:slim

WORKDIR /usr/src/app

COPY package*.json .

RUN npm install 

COPY . .

EXPOSE 3000

CMD [ "sh", "-c", "node index.js" ]
