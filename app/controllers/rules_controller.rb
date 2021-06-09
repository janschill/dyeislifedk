# frozen_string_literal: true

# require "github/markup"


class RulesController < ApplicationController
  def index
    file_name_english = "english.md"
    path_to_markdown_file = "#{Rails.root}/data/rules/#{file_name_english}"

    @rules_english_markdown = File.read(path_to_markdown_file)
  end
end
