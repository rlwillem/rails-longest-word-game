# test/system/games_test.rb
require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  test "Going to /new gives us a new random grid to play with" do
    visit new_url
    assert test: "New game"
    assert_selector "li", count: 10
  end

  test "filling a random word that's not in the grid raises an error" do

    visit new_url
    fill_in 'word_form', with: "rainbow"
    click_on('Play')
    assert_selector "p",text: "Sorry but rainbow can't be built out of"
  end

  test "Filling in a non-English word raises an error" do
    visit new_url
    fill_in 'word_form', with: "r"
    click_on('Play')
    assert_selector "p", text: "Sorry but r does not seem a valid English word..."
  end
end
