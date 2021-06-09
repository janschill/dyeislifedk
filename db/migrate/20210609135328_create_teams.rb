# frozen_string_literal: true

class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :email_address
      t.string :player_name_1
      t.string :player_name_2
      t.datetime :payed_fee_at
      t.string :challonge_team_id

      t.timestamps
    end
  end
end
