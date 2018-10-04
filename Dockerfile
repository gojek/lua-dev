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
RUN apk add build-base git bash zip unzip curl
RUN ln -s /usr/bin/luarocks-$LUA_VERSION /usr/bin/luarocks
RUN luarocks install lua-cjson
RUN luarocks install busted
ENV LUA_PATH=/usr/local/share/lua/5.3/?.lua;/usr/local/share/lua/5.3/?/init.lua;/usr/local/lib/lua/5.3/?.lua;/usr/local/lib/lua/5.3/?/init.lua;/usr/share/lua/5.3/?.lua;/usr/share/lua/5.3/?/init.lua;/usr/lib/lua/5.3/?.lua;/usr/lib/lua/5.3/?/init.lua;/usr/share/lua/common/?.lua;/usr/share/lua/common/?/init.lua;./?.lua;./?/init.lua
ENV LUA_CPATH=/usr/local/lib/lua/5.3/?.so;/usr/local/lib/lua/5.3/loadall.so;/usr/lib/lua/5.3/?.so;/usr/lib/lua/5.3/loadall.so;./?.so
