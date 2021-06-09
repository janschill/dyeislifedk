require "application_system_test_case"

class TeamsTest < ApplicationSystemTestCase
  setup do
    @team = teams(:one)
  end

  test "visiting the index" do
    visit teams_url
    assert_selector "h1", text: "Teams"
  end

  test "creating a Team" do
    visit teams_url
    click_on "New Team"

    fill_in "Challonge team", with: @team.challonge_team_id
    fill_in "Email address", with: @team.email_address
    fill_in "Name", with: @team.name
    fill_in "Payed fee at", with: @team.payed_fee_at
    fill_in "Player name 1", with: @team.player_name_1
    fill_in "Player name 2", with: @team.player_name_2
    click_on "Create Team"

    assert_text "Team was successfully created"
    click_on "Back"
  end

  test "updating a Team" do
    visit teams_url
    click_on "Edit", match: :first

    fill_in "Challonge team", with: @team.challonge_team_id
    fill_in "Email address", with: @team.email_address
    fill_in "Name", with: @team.name
    fill_in "Payed fee at", with: @team.payed_fee_at
    fill_in "Player name 1", with: @team.player_name_1
    fill_in "Player name 2", with: @team.player_name_2
    click_on "Update Team"

    assert_text "Team was successfully updated"
    click_on "Back"
  end

  test "destroying a Team" do
    visit teams_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Team was successfully destroyed"
  end
end
