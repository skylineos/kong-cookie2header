package = "kong-cookie2header"
version = "dev-1"
source = {
    url = "git://github.com/skylineos/kong-cookie2header",
    tag = "master",
    dir = "kong-cookie2header"
}
description = {
   homepage = "https://github.com/skylineos/kong-cookie2header",
   license = "MIT"
}
dependencies = {
   "lua >= 5.3",
   "lua-resty-cookie >= 0.1.0"
}
build = {
   type = "builtin",
   modules = {
      ["kong.plugins.cookie2header.handler"] = "handler.lua",
      ["kong.plugins.cookie2header.schema"] = "schema.lua"
   }
}
