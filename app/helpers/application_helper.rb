# frozen_string_literal: true

# Helper for Application
module ApplicationHelper
  def display_pretty_json(data)
    content_tag(:p) do
      content = content_tag(:button, "See more", id: "preprocessed_data-toggle")
      content << content_tag(:button, "Copy", id: "preprocessed_data-copy", data: {copied: "Copied!"})
      content << content_tag(:pre, JSON.pretty_generate(data), id: "preprocessed_data", class: "preprocessed_data small")
    end
  end

  def analyses_count_for(processing)
    processing&.analyses.select { |analyse| analyse.file.present? }.count
  end

  def infer_path(path)
    return path unless path.nil?

    self.send("#{controller_name}_path")
  end

  def search_query_placeholder(query)
    query.to_s.gsub("_", " ").gsub("cont", "contains").capitalize
  end

  def bootstrap_class_for(flash_type)
    {
        success: "bg-success",
        error: "bg-danger",
        alert: "bg-warning",
        notice: "bg-info"
    }.stringify_keys[flash_type.to_s]
  end

  def empty_search_path
    request.path
  end

  def search_in_progress?
    request.params.fetch("q", false)
  end
end
