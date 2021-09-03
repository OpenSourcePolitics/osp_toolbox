# frozen_string_literal: true

# Helper for Application
module ApplicationHelper
  def display_pretty_json(data)
    content_tag(:p) do
      content = content_tag(:button, "See more", id: "preprocessed_data-toggle")
      content << content_tag(:button, "Copy", id: "preprocessed_data-copy", data: {copied: "Copied!"})
      content << content_tag(:pre, JSON.pretty_generate(data), id: "preprocessed_data", class: "small")
    end
  end

  def analyses_for(processing)
    processing&.analyses.select { |analyse| analyse.file.present? }.map(&:typename).join(", ")
  end
end
