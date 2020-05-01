FROM ubuntu

COPY projects /root

RUN apt-get update && apt-get install -y python3-pip
RUN pip3 install django dj_database_url

RUN sed -i "s/'whitenoise.middleware.WhiteNoiseMiddleware',//" /root/covid19/covid19/settings.py 

WORKDIR /root/covid19
CMD ["python3","manage.py","runserver"]
