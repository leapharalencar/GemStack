require "httparty"

class SpotApi
    include HTTParty
    base_uri "https://spotlab-api.herokuapp.com"

    def session(payload)
        result = self.class.post(          
            "/sessions",
            body: payload.to_json,
            headers: { "Content-Type": "application/json" }
        )        
        return result
    end
end