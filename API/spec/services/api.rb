require "httparty"

class SpotApi
    include HTTParty
    base_uri "https://spotlab-api.herokuapp.com"

    def session(payload)
        self.class.post(          
            "/sessions",
            body: payload.to_json,
            headers: { "Content-Type": "application/json" }
        )
    end

    def save_spot(payload, @user_id)
        self.class.post(          
            "/spots",
            body: payload.to_json,
            headers: { "Content-Type": "application/json" }
        )
    end
end