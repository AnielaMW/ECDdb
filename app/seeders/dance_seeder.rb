class DanceDevSeeder

  json = ActiveSupport::JSON.decode(File.read('dance_data/header.json'))


  def self.seed!
    # need to create a record for each dance
    # need to link to, via foreign key, or create a new record for each formation, key*, level*, meter, mood*, and tempo*
    # need to seed each dance_direction with it's associated dance
  end
end
