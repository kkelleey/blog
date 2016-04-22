require 'rake'
namespace :set_posts_counts_on_city do
  desc 'fill the posts_count value in cities table (counter cache)'
  task :fill => :environment do
    City.find_each { |city| City.reset_counters(city.id, :posts) }
  end
end
