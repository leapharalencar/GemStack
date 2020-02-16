
describe "GET /dashboard" do 

    before(:all) do
        result = SpotApi.new.session({email: "leapharalencar@yahoo.com.br"})
        @user_id = result.parsed_response["_id"]

        spots = [
            {thumbnail: "yahoo.jpg", company: "Yahoo", techs: ["java","elixir"], price: 10, user: @user_id.to_mongo_id},
            {thumbnail: "oracle.jpg", company: "Oracle", techs: ["java","C"], price: 10, user: @user_id.to_mongo_id},
            {thumbnail: "nvidia.jpg", company: "NVidia", techs: ["C","golang"], price: 10, user: @user_id.to_mongo_id},
        ]
        MongoDb.new.save_spots(spots)
    end

    describe "when get spot list" do

        before(:all) do
            @result = SpotApi.new.dash(@user_id)
        end

        it "should return 200" do  
            expect(@result.response.code).to eql "200"
        end
        
        it "should return list" do
            expect(@result.parsed_response).not_to be_empty
        end

    end
    
end