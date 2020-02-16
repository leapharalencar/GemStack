require "mongo"

Mongo::Logger.level = Logger::INFO
Mongo::Logger.logger = Logger.new("./logs/mongo.log")

class MongoDb
    def remove_company(company, user_id)        
        query = {company: company, user: user_id.to_mongo_id}
        spots.delete_many(query)
    end

    # Salva uma lista de spots
    def save_spots(spots)
        spots.delete_many({user: spots.first[:user]})
        spots.insert_many(spots)
    end

     # Salva um único spot
     def save_spot(spot)
        spots.delete_many({user: spot[:user]})
        result = spots.insert_one(spot)
        return result.inserted_id
    end

    def mongo_id 
        return BSON::ObjectId.new
    end

    private

    def client
        return Mongo::Client.new("mongodb://qaninja:qaninja123@ds035664.mlab.com:35664/spotdb?retryWrites=false")
    end

    def spots
        return client[:spots]
    end

    def users
        return client[:users]
    end
end


