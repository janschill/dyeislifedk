json.extract! tournament, :id, :title, :city, :start_date, :end_date, :challonge_tournament_id, :signup_end_date, :created_at, :updated_at
json.url tournament_url(tournament, format: :json)
