module MapsHelper
  def map_data
    {
      src: maps_path(format: :json),
      # latitude: Rails.configuration.site_information['map']['latitude'],
      # longitude: Rails.configuration.site_information['map']['longitude'],
      # zoom: Rails.configuration.site_information['map']['zoom'],
    }.merge(Rails.configuration.site_information['map'])
  end
end
