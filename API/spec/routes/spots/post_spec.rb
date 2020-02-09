
describe "POST /spots" do
    context "when save spot" do
        before(:all) do
            @result = SpotApi.new.session({email: "leapharalencar@yahoo.com.br"})
            @user_id = result.parsed_response["_id"]
        end
    
        it "should return 200" do    
            
            thumbnail

            payload = {
                thumbnail: "google.jpg",
                company: "Google",
                techs:"java, golang, node",
                price: "30"
            }

            result = SpotApi.post(
                "/spots",
                body: payload,
                headers: { "user_id" => @user_id }
            )

            expect(result.response.code).to eql "200"
        end
    end
end