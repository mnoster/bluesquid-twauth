FROM ubuntu:20.04


RUN apt update && apt install -y pipenv

ARG LANG="en_US.UTF-8"
ARG LC_ALL="en_US.UTF-8"
ARG LC_CTYPE="en_US.UTF-8"

# Create app directory
WORKDIR /app
COPY . /app

EXPOSE 5000

RUN pipenv install --system --ignore-pipfile
RUN pipenv run python


CMD [ "python3", "twauth-web.py"]