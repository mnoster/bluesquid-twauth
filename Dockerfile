FROM ubuntu:20.04

# Create app directory

RUN apt update && apt install -y pipenv

ARG LANG="en_US.UTF-8"
ARG LC_ALL="en_US.UTF-8"
ARG LC_CTYPE="en_US.UTF-8"

WORKDIR /app
# Bundle app source
COPY . /app

RUN pipenv install --system --ignore-pipfile
RUN pipenv run python

EXPOSE 5000

CMD [ "python3", "twauth-web.py"]