require "faker"

class Generator
  # Generates a JSON file with 1000 randomly generated restaurants.
  # The file has already been generated so you don't need to run it again.
  def write_to_file
    json = Array.new(1000) { restaurant }.to_json
    File.write("restaurants.json", json)
  end

  private

  def restaurant
    {
      name: Faker::Restaurant.name,
      type: Faker::Restaurant.type,
      description: Faker::Restaurant.description,
      rating: rand(2...5.0).round(1),
      location: {
        lat: Faker::Address.latitude,
        lon: Faker::Address.longitude
      },
      menu: Array.new(rand(5..10)) { Faker::Food.dish }
    }
  end
end
