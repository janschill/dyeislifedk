# frozen_string_literal: true

class CreateTournaments < ActiveRecord::Migration[6.1]
  def change
    create_table :tournaments do |t|
      t.string :title
      t.string :city
      t.datetime :start_date
      t.datetime :end_date
      t.string :challonge_tournament_id
      t.datetime :signup_end_date

      t.timestamps
    end
  end
end
