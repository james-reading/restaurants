require "elasticsearch"
require "hashie"

class Search
  def initialize(params)
    @params = params
  end

  # The elastic search response. hashie just gives us convenient method-like accessors for hash keys (response.hits VS response["hits"])
   def response
    response = Elasticsearch::Client.new.search(
      index: "restaurants",
      body: {
        query: {
          match_all: {}
        }
      }
    )

    Hashie::Mash.new(response)
  end

  # Returns an array of restaurant hashes, plucked from the response.
  def results
    response.hits.hits.map(&:_source)
  end

  private

  # The search query string.
  def query
    @params[:query]
  end

  # An array of restaurant types. Can be nil.
  def type
    @params[:type]
  end

  # The minimum rating. Can be nil
  def rating
    @params[:rating]
  end
end
