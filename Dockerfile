FROM python:3.7

RUN git clone https://github.com/ghassencherni/notes.git

WORKDIR notes

RUN pip install -r requirements.txt

ENV FLASK_APP /notes

ENV FLASK_ENV development

#ENV DB_HOST 192.168.0.13

COPY v1.0.40 . 

EXPOSE 80

COPY docker-entrypoint.sh /usr/local/bin

RUN chmod 777 /usr/local/bin/docker-entrypoint.sh

#RUN docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]

CMD flask db upgrade ; flask run --host 0.0.0.0 --port 80
#CMD ["flask","db","upgrade",";","flask","run","--host","0.0.0.0","--port","80"]
#CMD ["docker-entrypoint.sh","||","true","&&","flask","run","--host","0.0.0.0","--port","80"]
