FROM ubuntu:22.04

# avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies (from ./.setup/bootstrap.sh)
RUN apt-get update
RUN apt-get install -y sudo
RUN apt-get install -y lsb-release

# needrestart & rsync required for ./.setup/install_system.sh
RUN apt-get install -y needrestart
RUN apt-get install -y rsync

# postgresql
RUN apt-get install -y postgresql postgresql-contrib

# Systemd needed in boot
RUN apt-get install -y systemd


# Setup working directory and copy Submitty files
WORKDIR /usr/local/submitty/GIT_CHECKOUT/Submitty
COPY . /usr/local/submitty/GIT_CHECKOUT/Submitty

CMD ["/bin/bash"]

# sudo service postgresql start
# sudo systemctl enable postgresql

# sudo -u postgres psql
# CREATE USER submitty_dbuser WITH PASSWORD 'submitty_dbuser';
# CREATE DATABASE submitty;
# GRANT ALL PRIVILEGES ON DATABASE submitty TO submitty_dbuser;
# \q

# sudo service ntp start || true

# sudo bash .setup/install_system.sh
