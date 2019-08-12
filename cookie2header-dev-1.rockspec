package = "kong-cookie2header"
version = "dev-1"
source = {
   url = "*** please add URL for source tarball, zip or repository here ***"
}
description = {
   homepage = "https://github.com/skylineos/kong-cookie2header",
   license = "MIT"
}
dependencies {
   "lua >= 5.1",
   "lua-resty-cookie >= 0.1.0" 
}
build = {
   type = "builtin",
   modules = {}
}
