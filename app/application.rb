class Application

    @@items = [Item.new("Taco",6.55), Item.new("Burrito",7.99)]

    def call(env)

        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)

            item_title = req.path.split("/items/").last

                if item = @@items.find{|i| i.name == item_title}
                    resp.write item.price
                else
                    resp.write "Item not found"
                    resp.status = 400
                end
        else
            resp.write "Route not found"
            resp.status = 404
        end

        resp.finish

    end
    
end