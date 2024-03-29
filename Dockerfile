FROM circleci/python:3.6-buster

# install dependencies
ADD requirements.txt requirements.txt
RUN sudo apt-get -y install libc-dev
RUN sudo pip install -U pip
RUN sudo pip install -r requirements.txt

# copy flask source
ADD flask_app /flask_app
RUN sudo mkdir /flask_app/static/users
RUN sudo chown -R circleci:circleci /flask_app/static/users/

ENV FLASK_APP flask_app
ENV FLASK_RUN_HOST 0.0.0.0

CMD ["flask", "run"]
