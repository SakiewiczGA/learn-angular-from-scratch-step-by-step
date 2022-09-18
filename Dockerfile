#using Node v10
FROM node:10

#Create app directory
WORKDIR /usr/src/lafs

#Install app dependencies
#A wildcard is used to ensure both package.json and package-lock.json are copied
#where available (npm@5+)
COPY package*.json ./

RUN npm install -g @angular/cli@v6-lts
RUN npm install


#if building code for production
#RUN npm ci --only=production

#Bundle app source
COPY . .

#expose port 3000 outside container
EXPOSE 4200

#command used to start application
CMD ng serve --host 0.0.0.0