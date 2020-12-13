set :chronic_options, hours24: true

every 1.day, at: '3:00' do
  rake " fill_articles:update"
end