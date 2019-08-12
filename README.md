# kong-cookie2header

**kong-cookie2header** is a plugin for Kong that allows a cookie value to be mapped to a header value.

## Install

1. Install `Lua` and `Luarocks`
    * @see - [https://github.com/luarocks/luarocks/wiki/Installation-instructions-for-Unix](https://github.com/luarocks/luarocks/wiki/Installation-instructions-for-Unix)
1. Clone the repository
    * `git clone https://github.com/skylineos/kong-cookie2header.git`
1. Install locally
    * `luarocks install [path/to]/kong-cookie2header/kong-cookie2header-dev-1.rockspec`
    * Note that if you want this to be installed in the current directory, ensure that the `lua_modules` directory exists in the current directory
