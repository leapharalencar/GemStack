require "httparty"

describe "POST /sessions" do

    it "new session" do

        payload = {email: "leapharalencar@yahoo.com.br"}

        result = HTTParty.post(
            'https://spotlab-api.herokuapp.com/sessions',
            body: payload.to_json,
            headers: { "Content-Type": "application/json" }
        )
        expect(result.response.code).to eql '200'
    end

end
