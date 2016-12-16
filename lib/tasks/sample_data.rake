require 'carrierwave/orm/activerecord'

namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_pictures
  end
end

def make_pictures
  @admin = User.create!(email:    "example@railstutorial.org",
                       password: "foobar",
                       password_confirmation: "foobar",)
  Dir.entries(Dir.home.to_s + "/pic_dir").each do |dir|
    Dir.chdir(Dir.home.to_s + "/pic_dir")
    if File.directory?(dir) && dir != '.' && dir != '..'
      @category = Category.create!( name: dir )
      Dir.chdir(Dir.home.to_s + "/pic_dir/" + dir)
      files = Dir.entries(Dir.home.to_s + "/pic_dir/" + dir).select do |item|
        File.file?(item)
      end
      files.each do |file|
        pict = Picture.new(description: file, user: @admin,
                           category: @category,)
        File.open(Dir.home.to_s + "/pic_dir/" + dir + "/" + file) do |f|
          pict.location = f
        end
        pict.save!
      end
    end
  end
end
