class UserDevSeeder
  USERS = [
    {
      first_name: "Aniela",
      last_name: "Wolkonowski",
      email: "anielamw@gmail.com",
      encrypted_password: "12041980",
      admin: true
    }, {
      first_name: "Dan",
      last_name: "Seppler",
      email: "dansemail@gmail.com",
      encrypted_password: "5678910",
      admin: true
    }, {
      first_name: "Anne",
      last_name: "Elliot",
      email: "annesemail@gmail.com",
      encrypted_password: "123456"
    }
  ]

  def self.seed!
    USERS.each do |user_params|
      email = user_params[:email]
      user = User.find_or_initialize_by!(email: email)
      user.update_attributes!(user_params)
    end
  end
end
