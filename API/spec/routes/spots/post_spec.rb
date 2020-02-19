
describe "POST /spots" do    
    before(:all) do
        result = SpotApi.new.session({email: "leapharalencar@yahoo.com.br"})
        @user_id = result.parsed_response["_id"]
    end

    context "when save spot" do          
        before(:all) do            
            thumbnail = File.open(File.join(Dir.pwd, 'spec/images', 'google.jpg'))

            payload = {
                thumbnail: thumbnail,
                company: "Google",
                techs:"java, golang, node",
                price: "30"
            }

            MongoDb.new.remove_company(payload[:company], @user_id)

            @result = SpotApi.new.save_spot(payload, @user_id)
        end

        it "should return 200" do  
            expect(@result.response.code).to eql "200"
        end
    end

    context "when empty company" do
        before(:all) do                   
            thumbnail = File.open(File.join(Dir.pwd, 'spec/images', 'google.jpg'))

            payload = {
                thumbnail: thumbnail,
                company: "",
                techs:"java, golang, node",
                price: "30"
            }
            @result = SpotApi.new.save_spot(payload, @user_id)
        end

        it "should return 412" do   
            expect(@result.response.code).to eql "412"
        end

        it "should return code 1001" do   
            expect(@result.parsed_response["code"]).to eql 1001
        end
        
        it "should return required company" do   
            expect(@result.parsed_response["error"]).to eql "Company is required"
        end
    end

    # desafio técnico
    # empty thumbnail

    context "when empty thumbnail" do          
        before(:all) do        

            payload = {
                thumbnail: "",
                company: "Google",
                techs:"java, golang, node",
                price: "30"
            }          

            @result = SpotApi.new.save_spot(payload, @user_id)
        end

        it "should return 412" do  
            expect(@result.response.code).to eql "412"
        end
    end

    # empty techs

    context "when empty techs" do          
        before(:all) do            
            thumbnail = File.open(File.join(Dir.pwd, 'spec/images', 'google.jpg'))

            payload = {
                thumbnail: thumbnail,
                company: "Google",
                techs:"",
                price: "30"
            }

            @result = SpotApi.new.save_spot(payload, @user_id)
        end

        it "should return 412" do  
            expect(@result.response.code).to eql "412"
        end
    end
end