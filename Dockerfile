 FROM node:6-alpine

RUN mkdir -p /twitter-clone-1

ADD ./package.json /twitter-clone-1/package.json

WORKDIR /twitter-clone-1/
RUN npm install --production -q

ADD ./ /twitter-clone-1/

#Comando que inicia
CMD [ "node", "app" ]
