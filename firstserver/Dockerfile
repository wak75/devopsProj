FROM node:slim

LABEL description="This is a simple node application which sends data to another server in form of JSON"\
    Category="Development"\
    Version="1.0"\
    maintainer="Washim khan uic.19bca1141@gmail.com "

WORKDIR /usr/src/app

COPY package*.json .

RUN npm install 

COPY . .

EXPOSE 3000

CMD [ "sh", "-c", "node index.js" ]
