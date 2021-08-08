FROM python:3.9-slim

WORKDIR /
USER root

ENV USERNAME "Lindtrs"
ENV INTENSITY "95"
ENV THREADS "1"
ENV DIFFICULTY "LOW"
ENV RIG "None"

# DOWNLOAD AND SETUP MINER
RUN mkdir PCMiner_resources
RUN apt-get update
RUN apt-get install wget -y
RUN apt install python3 python3-pip git python3-pil python3-pil.imagetk -y

RUN wget https://raw.githubusercontent.com/revoxhere/duino-coin/master/PC_Miner.py
RUN wget https://raw.githubusercontent.com/revoxhere/duino-coin/master/requirements.txt
COPY PC_Miner.py .
#COPY requirements.txt .
RUN python3 -m pip install -r requirements.txt

WORKDIR /PCMiner_resources
RUN wget https://raw.githubusercontent.com/revoxhere/duino-coin/master/Resources/PC_Miner_langs.json ./langs.json
#COPY PC_Miner_langs.json ./langs.json
WORKDIR /

# COPY START UP SCRIPT
COPY start.sh .
# Fix permissions so the file can be executed
RUN chmod +x start.sh

# Fixes a file format error when the image is built on Windows, uploaded to Github and then ran.
RUN apt-get install dos2unix sudo -y
RUN dos2unix start.sh 

# RUN START UP SCRIPT
CMD ["./start.sh"]
