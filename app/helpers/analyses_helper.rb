module AnalysesHelper
  def available_analyses_typename
    Analysis.available_analyses
  end

  def available_analyses_typename_for_select
    available_analyses_typename.map(&:to_s).map { |typename| [typename.titleize, typename] }
  end

  def categories_for_select(processing)
    processing.available_categories.map { |category| [category&.titleize, category] }
  end
end
