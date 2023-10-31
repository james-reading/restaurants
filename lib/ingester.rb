require "elasticsearch"
require "elasticsearch/helpers/bulk_helper"

class Ingester
  def initialize
    @client = Elasticsearch::Client.new
  end

  # You can't change the mapping for an existing index. So this will delete the
  # index, create a new one, and ingest the data again.
  def reset
    puts "Deleting index..."
    delete_index
    puts "Creating index..."
    create_index
    puts "Ingesting data..."
    ingest_json
    true
  end

  def delete_index
    @client.indices.delete(index: "restaurants", ignore_unavailable: true)
  end

  def create_index
    @client.indices.create(
      index: "restaurants",
      body: {
        # https://www.elastic.co/guide/en/elasticsearch/reference/8.10/analysis-custom-analyzer.html
        settings: {

        },
        # https://www.elastic.co/guide/en/elasticsearch/reference/8.10/explicit-mapping.html#create-mapping
        mappings: {

        }
      }
    )
  end

  def ingest_json
    bulk_helper = Elasticsearch::Helpers::BulkHelper.new(@client, "restaurants")
    bulk_helper.ingest_json("restaurants.json")
  end
end
