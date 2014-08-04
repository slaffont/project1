class Game < ActiveRecord::Base
   has_many :photos

    def self.api_call

        response = HTTParty.get("http://api.nytimes.com/svc/mostpopular/v2/mostemailed/all-sections/7.json?api-key=#{Rails.application.secrets.nyt_api_key}")

        random_indices = []
        while random_indices.length < 3
            random_index = rand(response["results"].length)
            random_indices << random_index unless random_indices.include?(random_index)
        end

        game = random_indices.first

        game = Game.create(
            :article_title => response["results"][random_indices.first]["title"],
            :article_url => response["results"][random_indices.first]["url"]
        )
        Photo.create(
            :image_url => response["results"][random_indices.first]["media"][0]["media-metadata"][0]["url"],
            :article_url => response["results"][random_indices.first]["url"],
            :game_id => game.id
        )
        random_indices.slice(1, 2).each do |index|
            Photo.create(
                :image_url => response["results"][index]["media"][0]["media-metadata"][0]["url"],
                :game_id => game.id
            )
        end
        game
    end
end
