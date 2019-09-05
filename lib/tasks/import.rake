require 'csv'

namespace :import do
  task ramen: :environment do
    items = []

    CSV.foreach('./lib/data/ramen.csv', headers: true) do |row|
      items << row.to_h
    end

    Item.import(items)
  end
end
