FROM ubuntu:14.04
MAINTAINER James Wang <james@slickage.com>

# Locales all to en_US.UTF-8
RUN locale-gen en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN apt-get update && apt-get -y install wget curl
RUN echo "deb http://packages.erlang-solutions.com/ubuntu precise contrib" >> /etc/apt/sources.list
RUN wget http://packages.erlang-solutions.com/ubuntu/erlang_solutions.asc
RUN apt-key add erlang_solutions.asc
RUN apt-get update && apt-get -y install erlang git make

RUN git clone https://github.com/elixir-lang/elixir.git /elixir
WORKDIR /elixir

RUN git checkout v1.0.3 && make clean test
RUN mkdir /project

ENV PATH $PATH:/elixir/bin
WORKDIR /project
RUN mix archive.install https://github.com/phoenixframework/phoenix/releases/download/v1.0.3/phoenix_new-1.0.3.ez

EXPOSE 4000
