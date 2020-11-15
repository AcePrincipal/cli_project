class Api
    attr_accessor :query 
    
    def initialize(query)
        @query = query 
    end

    def fetch_charities
        url = "http://data.orghunter.com/v1/charitysearch?user_key=ecfaf7afdf6cd185bb0610522a91bf84&searchTerm=#{query}"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        charities = JSON.parse(response)
        charities["data"][1..10]
    end

    def create_charities
        self.fetch_charities.each{|charity| Charity.new(charity["charityName"], charity["url"], charity["donationUrl"])}
    end
end