FROM node:slim

LABEL description="This is a simple node application which recieves data in json format and reverse the message"\
    Category="Development"\
    Version="1.0"\
    maintainer="Washim khan uic.19bca1141@gmail.com"

WORKDIR /usr/src/app 

COPY package*.json .

RUN npm install 

COPY . .

EXPOSE 4000

CMD [ "sh", "-c", "node index.js" ]
