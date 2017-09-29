# We're importing the files inside the db/seeds directory
# We have a lot to seed, and now we're trying to keep it organised
# http://codebeerstartups.com/2014/01/spliting-seed-file-into-multiple-files-in-ruby-on-rails/

Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each { |seed| load seed }
