local typedefs = require "kong.db.schema.typedefs"

return {
  name = "cookie2header",
  fields = {
    {
      config = {
        type = "record",
        fields = {
          {
            logout_path = {
              type = "string",
              required = false,
            },
          },
          {
            cookie_name = {
              type = "string",
              required = true,
            },
          },
          {
            header_key = {
              type = "string",
              required = true,
            }
          },
        },
      },
    }
  },
}