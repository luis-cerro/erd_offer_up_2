require "open-uri"
class Item < ApplicationRecord
  before_validation :geocode_item_location

  def geocode_item_location
    if item_location.present?
      url = "https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV['GMAP_API_KEY']}&address=#{URI.encode(item_location)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.item_location_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.item_location_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.item_location_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  # Direct associations

  belongs_to :item_status,
             class_name: "Status",
             counter_cache: true

  belongs_to :owner,
             class_name: "User",
             counter_cache: true

  belongs_to :item_category,
             class_name: "Category",
             counter_cache: true

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    item_description
  end
end
