FROM ruby:2.6.2

LABEL maintainer 'Markus Gulden <mg@gulden.consulting>'

RUN gem install cassandra-web -v 0.5.0
COPY run.sh /
RUN chmod +x /run.sh

CMD ["/run.sh"]