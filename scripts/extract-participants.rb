require "json"

tournament_file_name = "tournament-2021.json"

participants_file = File.read("./data/#{tournament_file_name}")
parsed_participants = JSON.parse(participants_file)

def no_team_name?(team_name)
  team_name.empty? ||
  team_name == " " ||
  team_name == "N/A"
end

def remove_comma(str)
  str.tr(",", "")
end

parsed_participants['teams'].map do |team|
  person_a = team['teamMembers'][0]
  person_b = team['teamMembers'][1]
  names = "#{person_a}&#{person_b}"
  if no_team_name?(team['teamName'])
    puts names[0, 30]
  else
    puts "#{remove_comma(team['teamName'])[0, 30]} (#{names})"
  end
end
