FROM tiangolo/uwsgi-nginx:python3.6

# Seshat API Image
###########################
# Mounting Points
RUN mkdir -p /conf /dataset /archive /workspace /scripts
# Logging
RUN mkdir -p /log
###########################
# Install Dependencies
# update pip
RUN pip install --upgrade pip
# server
RUN pip install gunicorn
# documentation
RUN pip install flasgger
# import project dependencies
RUN mkdir -p /src
COPY requirements.txt /src
RUN pip install -r /src/requirements.txt


FROM intermediate
##########################
# Copy source code
COPY . /src
##########################
# Entry point
CMD ["/start.sh"]
