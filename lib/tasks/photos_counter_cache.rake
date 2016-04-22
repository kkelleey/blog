namespace :photos_counter_cache do
  desc 'update photos_count column with current value'
  task fill: :environment do
    City.find_each { |city| City.reset_counters(city.id, :photos) }
  end
end
