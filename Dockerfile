FROM httpd:2.4

WORKDIR /usr/local/apache2/htdocs 

RUN mkdir /EFE-EGY

COPY index.html /usr/local/apache2/htdocs/ 

EXPOSE 80 

CMD ["httpd-foreground"]


