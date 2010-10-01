namespace :cache do
  desc "Clear all.js and all.css"
  task :clear do
    css_path = File.join ::Rails.root,"public/stylesheets/all.css"
    js_path = File.join ::Rails.root,"public/javascript/all.js"
    
    begin
    File.delete css_path
    rescue
      puts "all.css not found"
    end

    begin
      File.delete js_path
    rescue
      puts "all.js not found"
    end
  end
end
