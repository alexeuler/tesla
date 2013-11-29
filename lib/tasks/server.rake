namespace :server do
  host="teslablog.ru"
  deploy_path=host+":/var/www/zen"
  namespace :download do
    desc "Downloads images from server to public folder"
    task :images => :environment do
      system "scp -r #{deploy_path}/shared/images #{Rails.root}/public"
    end
    
    desc "Downloads production.db to development.db"
    task :db => :environment do
      system "scp -r #{deploy_path}/shared/db/production.sqlite3 #{Rails.root}/db/development.sqlite3"
    end
    
  end

  namespace :upload do
    desc "Uploads images from public folder to server"
    task :images => :environment do
      system "scp -r #{Rails.root}/public/images #{deploy_path}/shared/"
    end
  end

end


