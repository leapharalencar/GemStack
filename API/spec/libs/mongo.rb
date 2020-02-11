require "mongo"

Mongo::Logger.level = Logger::INFO
Mongo::Logger.logger = Logger.new("./logs/mongo.log")

class MongoDb
    def remove_company(company, user_id)
        client = Mongo::Client.new("mongodb://qaninja:qaninja123@ds035664.mlab.com:35664/spotdb?retryWrites=false")
        collection = client[:spots]

        query = {company: company, user: user_id.to_mongo_id}

        collection.delete_many(query)
    end
end

class String
    def to_mongo_id
        BSON::ObjectId.from_string(self)
    end
end
