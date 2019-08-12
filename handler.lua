local BasePlugin = require "kong.plugins.base_plugin"
local Cookie2HeaderHandler = BasePlugin:extend()
local cookie = require "resty.cookie"

function Cookie2HeaderHandler:new()
    Cookie2HeaderHandler.super.new(self, "Cookie2Header")
end

function Cookie2HeaderHandler:rewrite(config)
    Cookie2HeaderHandler.super.rewrite(self)
    
    local ck = cookie:new()
    local hostName, err = ck:get(config.cookie_name)

    -- TODO: double check
    -- ngx.var.upstream_uri = ""

    if hostName then
        ngx.req.set_header("Host", hostName)
    end
    
    local isLogout = not (string.find(ngx.var.uri, config.logout_path) == nil)
    if isLogout then
        ngx.req.clear_header("Host")
    end
end

return Cookie2HeaderHandler