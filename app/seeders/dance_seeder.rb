class DanceDevSeeder

  def self.seed!
    .each do |dance_params|
      dance = Dance.find_or_initialize_by!(name: name)
      dance.update_attributes!(dance_params)
    end
  end
end
