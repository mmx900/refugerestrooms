module Locations
  def locations
    {
      Winnipeg: { latitude: 49.8975494, longitude: -97.140118 },
      Vancouver: { latitude: 49.281006, longitude: -123.089959 },
      Oakland: { latitude: 37.8044, longitude: -122.2708 }
    }
  end

  # rubocop:disable Metrics/MethodLength
  def mock_location(location_name)
    location = locations[location_name.to_sym]
    page.execute_script "
      navigator.geolocation.getCurrentPosition = function(success, failure) {
        success({ coords: {
          latitude: #{location[:latitude]},
          longitude: #{location[:longitude]}
        }, timestamp: Date.now() });
      }
    "
  end
  # rubocop:enable Metrics/MethodLength
end
