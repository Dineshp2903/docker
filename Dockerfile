FROM debian:buster-slim

ENV DEBIAN_FRONTEND=noninteractive


RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    openjdk-11-jre &&\
    apt-get install -y wget &&\
    apt-get install -y zip &&\
    apt-get install -y unzip &&\
    apt install jq -y &&\
    apt install curl -y

ENV JAVA_HOME /usr/lib/jvm/java-1.11.0-openjdk-amd64
RUN export JAVA_HOME
# Prints installed java version, just for checking
#RUN java --version


#### Zspeech CI #####

RUN apt-get update &&\
    apt-get install -y locales &&\
    apt-get install -y python3-pip &&\
    apt-get install -y ffmpeg &&\
    apt-get install -y git      &&\
    apt-get install -y vim      &&\
    apt-get install -y libsndfile-dev      &&\
    rm -rf /var/lib/apt/lists/*     &&\
    localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8    &&\
    pip3 install cmake==3.18      &&\
    pip3 install typing_extensions

ENV LANG=en_US.utf8

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-py38_4.8.3-Linux-x86_64.sh -O miniconda.sh     &&\
    bash miniconda.sh -b      &&\
    export PATH=~/miniconda3/bin:$PATH      &&\
    . ~/miniconda3/etc/profile.d/conda.sh     &&\
    conda config --set report_errors false      &&\
    conda init


RUN wget https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py     &&\
    python3 get-poetry.py      &&\
    echo "source $HOME/.poetry/env"
####   Shell Formatting Libraries ####

RUN wget http://ftp.jp.debian.org/debian/pool/main/g/golang-mvdan-sh/shfmt_3.5.1-1_amd64.deb

RUN apt install -y ./shfmt_3.5.1-1_amd64.deb





