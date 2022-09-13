class FoodService
 
    def self.search_food(food)
        response = conn.get("/fdc/v1/foods/search?query=#{food}")
        JSON.parse(response.body, symbolize_names: true) 
      end

    private  

    def self.conn
        Faraday.new(url: "https://api.nal.usda.gov") do |faraday|
          faraday.params['api_key'] = ENV['api_key']
        end
      end
end