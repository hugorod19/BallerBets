class Sport < ApplicationRecord
    has_many :teams
    has_many :games, class_name: 'Team', :source => :home_games

end
