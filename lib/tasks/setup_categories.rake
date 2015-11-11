desc "script to setup install categories"
task :setup_categories => :environment do 
	Category.create(name: "graphic designing")
	Category.create(name: "web designing")
	Category.create(name: "web development")
    Category.create(name: "mobile apps")	
end