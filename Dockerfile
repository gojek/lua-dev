FROM alpine:latest

ENV LUA_VERSION 5.3
ENV LUA_PACKAGE lua${LUA_VERSION}
ENV LUAROCKS_VERSION 3.9.2

# Install packages necessary for Lua, Luarocks.
RUN apk add ${LUA_PACKAGE}
RUN apk add ${LUA_PACKAGE}-dev
RUN apk add luajit
RUN apk add luarocks
# RUN apk add luaindent
RUN apk add build-base git bash zip unzip curl
RUN ln -s /usr/bin/luarocks-$LUA_VERSION /usr/bin/luarocks
RUN luarocks install lua-cjson
RUN luarocks install busted
RUN luarocks install luacheck
ENV LUA_PATH=/usr/local/share/lua/5.3/?.lua;/usr/local/share/lua/5.3/?/init.lua;/usr/local/lib/lua/5.3/?.lua;/usr/local/lib/lua/5.3/?/init.lua;/usr/share/lua/5.3/?.lua;/usr/share/lua/5.3/?/init.lua;/usr/lib/lua/5.3/?.lua;/usr/lib/lua/5.3/?/init.lua;/usr/share/lua/common/?.lua;/usr/share/lua/common/?/init.lua;./?.lua;./?/init.lua
ENV LUA_CPATH=/usr/local/lib/lua/5.3/?.so;/usr/local/lib/lua/5.3/loadall.so;/usr/lib/lua/5.3/?.so;/usr/lib/lua/5.3/loadall.so;./?.so
