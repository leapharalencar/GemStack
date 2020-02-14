
describe "GET /dashboard" do 

    before(:all) do
        result = SpotApi.new.session({email: "leapharalencar@yahoo.com.br"})
        @user_id = result.parsed_response["_id"]
    end

    describe "when get spot list" do

        before(:all) do
            @result = SpotApi.new.dash(@user_id)
        end
        
        it "should return list" do
            expect(@result.parsed_response).not_to be_empty
        end


    end
    
end