FROM alpine:3.8

MAINTAINER Irfan Shah<mail.urfi@gmail.com>

ENV LUA_VERSION 5.3
ENV LUA_PACKAGE lua${LUA_VERSION}
ENV LUAROCKS_VERSION 3.0.3

# Install packages necessary for Lua, Luarocks.
RUN apk add ${LUA_PACKAGE}
RUN apk add ${LUA_PACKAGE}-dev
RUN apk add luajit
RUN apk add luarocks
RUN apk add build-base git bash unzip curl
RUN luarocks-5.3 install lua-cjson
RUN luarocks-5.3 install busted
