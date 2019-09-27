local BasePlugin = require "kong.plugins.base_plugin"
local Cookie2HeaderHandler = BasePlugin:extend()
local cookie = require "resty.cookie"

function Cookie2HeaderHandler:new()
    Cookie2HeaderHandler.super.new(self, "Cookie2Header")
end

function Cookie2HeaderHandler:rewrite(config)
    Cookie2HeaderHandler.super.rewrite(self)

    local ck = cookie:new()
    local cookie, err = ck:get(config.cookie_name)

    if cookie then
        ngx.log(ngx.INFO, "Cookie found, writing to header.")
        ngx.log(ngx.DEBUG, "Header: ", config.header_key)
        ngx.log(ngx.DEBUG, "Value: ", cookie)
        ngx.req.set_header(config.header_key, cookie)
    end

    -- todo: possibly deprecated (or repurpose to ignore paths)
    local isLogout = config.logout_path ~= nil and not (string.find(ngx.var.uri, config.logout_path) == nil)
    if isLogout then
        ngx.log(ngx.LOG, "isLogout path hit, clearing hearing value")
        ngx.req.clear_header(config.header_key)
    end
end

return Cookie2HeaderHandler