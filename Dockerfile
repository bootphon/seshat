# Angular Builder Image
FROM tiangolo/node-frontend:10 as build-stage

WORKDIR /app

COPY client/package.json /app/

RUN npm install

COPY client/ /app

RUN echo $API_ROOT

RUN npm run build -- --prod

FROM tiangolo/uwsgi-nginx:python3.6-alpine3.8

# Seshat Image
###########################
# Useful folders
RUN mkdir -p /app /app/corpora /client  /log /conf

# installing ffmpeg for sound file decoding
RUN apk add --no-cache ffmpeg
# installing numpy dependencies
RUN apk --no-cache --update-cache add gcc gfortran python python-dev py-pip build-base wget freetype-dev libpng-dev openblas-dev
RUN ln -s /usr/include/locale.h /usr/include/xlocale.h

WORKDIR /app

# Dependencies
RUN pip install --upgrade pip

COPY server/requirements.txt /app

RUN pip install -r requirements.txt

# Copy Client sources
COPY --from=build-stage /app/dist/seshat-angular-client/ /client

# Server Sources
COPY server/ /app

RUN pip install .

RUN touch /app/__init__.py

# Copy Configurations
COPY install/ /conf

RUN cp /conf/seshat.ini uwsgi.ini
RUN cp /conf/client.conf /etc/nginx/conf.d/

# Copying prestart script to the app root
RUN cp /conf/prestart.sh /app/

##########################
# Entry point
ENTRYPOINT ["/start.sh"]
