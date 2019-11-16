FROM debian:latest

RUN apt-get update
RUN apt-get install -y djvulibre-bin 
RUN apt-get install -y ocrodjvu 
RUN apt-get install -y ruby
RUN apt-get install -y ruby-dev 
RUN apt-get install -y python 
RUN apt-get install -y libmagickwand-dev 
RUN apt-get install -y python-pip
RUN gem install pdfbeads

COPY ./requirements.txt /app/requirements.txt
RUN pip install -r /app/requirements.txt

COPY ./dpsprep /app/dpsprep

ENTRYPOINT ["/app/dpsprep"]
