class User < ApplicationRecord
    has_secure_password

    validates(:display_name, {uniqueness: true})
    validates(:email, {uniqueness: true})

    has_many :bets
    has_many :games, through: :bets
    has_many :teams, through: :games

end

 
