# frozen_string_literal: true

# Analyses Helper
module AnalysesHelper
  def available_analyses_typename
    Analysis::AVAILABLE_ANALYSES
  end

  def available_analyses_typename_for_select
    available_analyses_typename.map(&:to_s).map { |typename| [typename.capitalize, typename] }
  end

  def categories_for_select(processing)
    processing.available_categories.map { |category| [category&.capitalize, category] }
  end
end
