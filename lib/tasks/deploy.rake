namespace :deploy do
    desc "Drop and create the current database"
    task :images => :environment do
       system "scp -r #{Rails.root}/public/images teslablog.ru:/var/www/zen/shared/"
    end
end