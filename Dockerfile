FROM nginx:latest

# Set up workdir
ENV WORKDIR /var/www/html
WORKDIR $WORKDIR

# Install Dependencies
RUN apt-get update && apt-get install -y git-core

RUN git clone https://github.com/k-rush/cosmic-vibrations-website.git $WORKDIR

EXPOSE 80