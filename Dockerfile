# Angular Builder Image
FROM tiangolo/node-frontend:10 as build-stage

WORKDIR /app

COPY client/package.json /app/

RUN npm install

COPY client/ /app

RUN echo $API_ROOT

RUN npm run build --prod true

FROM tiangolo/uwsgi-nginx:python3.6

# Seshat Image
###########################
# Useful folders
RUN mkdir -p /app /app/data /client  /log /conf

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
# RUN cp /conf/nginx.conf /app

##########################
# Entry point
CMD ["/start.sh"]
