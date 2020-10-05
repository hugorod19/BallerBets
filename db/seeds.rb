# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'net/http'
require 'open-uri'
require 'json'

Team.destroy_all
Sport.destroy_all
Game.destroy_all
User.destroy_all
Bet.destroy_all

url = "https://www.thesportsdb.com/api/v1/json/1/search_all_teams.php?l=NBA" 
uri = URI.parse(url)
response = Net::HTTP.get_response(uri)
nba_teams = JSON.parse(response.body)

url = "https://www.thesportsdb.com/api/v1/json/1/search_all_teams.php?l=American%20Major%20League%20Soccer" 
uri = URI.parse(url)
response = Net::HTTP.get_response(uri)
soccer_teams = JSON.parse(response.body)

url = "https://www.thesportsdb.com/api/v1/json/1/search_all_teams.php?l=NFL" 
uri = URI.parse(url)
response = Net::HTTP.get_response(uri)
football_teams = JSON.parse(response.body)

url = "https://www.thesportsdb.com/api/v1/json/1/search_all_teams.php?l=MLB" 
uri = URI.parse(url)
response = Net::HTTP.get_response(uri)
baseball_teams = JSON.parse(response.body)

bb = Sport.create(sport_name: "Basketball")
fb = Sport.create(sport_name: "Football")
scc = Sport.create(sport_name: "Soccer")
base = Sport.create(sport_name: "Baseball")

nba_teams["teams"].each do | t |
    Team.create(jersey: t["strTeamJersey"], fan_art: t["strTeamFanart3"], banner: t["strTeamBanner"], website: t["strWebsite"], stadium_name: t["strStadium"], stadium_img: t["strStadiumThumb"], description: t["strDescriptionEN"], badge: t["strTeamBadge"], sport_id: bb.id, team_name: t["strTeam"])
end 

soccer_teams["teams"].each do | t |
    Team.create(jersey: t["strTeamJersey"], fan_art: t["strTeamFanart3"], banner: t["strTeamBanner"], website: t["strWebsite"], stadium_name: t["strStadium"], stadium_img: t["strStadiumThumb"], description: t["strDescriptionEN"], badge: t["strTeamBadge"], sport_id: scc.id, team_name: t["strTeam"])
end 

football_teams["teams"].each do | t |
    Team.create(jersey: t["strTeamJersey"], fan_art: t["strTeamFanart3"], banner: t["strTeamBanner"], website: t["strWebsite"], stadium_name: t["strStadium"], stadium_img: t["strStadiumThumb"], description: t["strDescriptionEN"], badge: t["strTeamBadge"], sport_id: fb.id, team_name: t["strTeam"])
end

baseball_teams["teams"].each do | t |
    Team.create(jersey: t["strTeamJersey"], fan_art: t["strTeamFanart3"], banner: t["strTeamBanner"], website: t["strWebsite"], stadium_name: t["strStadium"], stadium_img: t["strStadiumThumb"], description: t["strDescriptionEN"], badge: t["strTeamBadge"], sport_id: base.id, team_name: t["strTeam"])
end

schedule = []

url = "https://www.thesportsdb.com/api/v1/json/1/eventspastleague.php?id=4424"
#past 15 baseball games
uri = URI.parse(url)
response = Net::HTTP.get_response(uri)
schedule << JSON.parse(response.body)

url1 = "https://www.thesportsdb.com/api/v1/json/1/eventsnextleague.php?id=4424"
#next few baseball games
uri1 = URI.parse(url1)
response1 = Net::HTTP.get_response(uri1)
schedule << JSON.parse(response1.body)

url2 = "https://www.thesportsdb.com/api/v1/json/1/eventspastleague.php?id=4391"
#last 15 football games
uri2 = URI.parse(url2)
response2 = Net::HTTP.get_response(uri2)
schedule << JSON.parse(response2.body)

url3 = "https://www.thesportsdb.com/api/v1/json/1/eventsnextleague.php?id=4391"
#next 15 football games
uri3 = URI.parse(url3)
response3 = Net::HTTP.get_response(uri3)
schedule << JSON.parse(response3.body)

url4 = "https://www.thesportsdb.com/api/v1/json/1/eventspastleague.php?id=4346"
#last 15 soccer games 
uri4 = URI.parse(url4)
response4 = Net::HTTP.get_response(uri4)
schedule << JSON.parse(response4.body)

url5 = "https://www.thesportsdb.com/api/v1/json/1/eventsnextleague.php?id=4346"
#next 15 soccer games
uri5 = URI.parse(url5)
response5 = Net::HTTP.get_response(uri5)
schedule << JSON.parse(response5.body)

url6 = "https://www.thesportsdb.com/api/v1/json/1/eventspastleague.php?id=4387"
#last 15 basketball soccer games
uri6 = URI.parse(url6)
response6 = Net::HTTP.get_response(uri6)
schedule << JSON.parse(response6.body)

url7 = "https://www.thesportsdb.com/api/v1/json/1/eventsnextleague.php?id=4387"
#next few basketball soccer games
uri7 = URI.parse(url7)
response7 = Net::HTTP.get_response(uri7)
schedule << JSON.parse(response7.body)

schedule.each do |league|
    league["events"].each do | t |
        Game.create(home_score: t["intHomeScore"], away_score: t["intAwayScore"], date: t["dateEvent"], home_team_id: Team.find_by(team_name: t["strHomeTeam"]).id, away_team_id: Team.find_by(team_name: t["strAwayTeam"]).id)
    end
end 

# baseball_schedule["events"].each do | t |
#     Game.create(home_team_id: Team.find_by(team_name: t["strHomeTeam"]).id, away_team_id: Team.find_by(team_name: t["strAwayTeam"]).id)
# end


# url = "https://www.thesportsdb.com/api/v1/json/1/eventspastleague.php?id=4391"
# uri = URI.parse(url)
# response = Net::HTTP.get_response(uri)
# football_schedule = JSON.parse(response.body)

# football_schedule["events"].each do | t |
#     # home_team = (Team.find_by(team_name: t["strHomeTeam"]))
#     # away_team = (Team.find_by(team_name: t["strAwayTeam"]))
#     Game.create(home_team_id: Team.find_by(team_name: t["strHomeTeam"]).id, away_team_id: Team.find_by(team_name: t["strAwayTeam"]).id)
# end

u1 = User.create(display_name: "Fake Name", email: "email@gmail.com", password: "password", basketball_team_id: bb.teams.first.id , football_team_id: fb.teams.first.id, baseball_team_id: base.teams.first.id, soccer_team_id: scc.teams.first.id)
b1 = Bet.create(user_id: u1.id, game_id: Game.first.id, team_id: Game.first.home_team.id, amount: 10)
b2 = Bet.create(user_id: u1.id, game_id: Game.second.id, team_id: Game.second.home_team.id, amount: 10)
puts "BallerBets has been seeded!"
#Team.create(team_name: "Hugo's Team", sport_id: s1.id)

#byebug