FROM node:22

RUN adduser --disabled-password --disabled-login --shell /bin/sh --no-create-home --uid 1234 user

WORKDIR /usr/src/app
COPY . .

RUN npm install
RUN chown -R user:user /usr/src/app
USER user

CMD [ "node", "server.js" ]
