# frozen_string_literal: true

# Helpers for processings
module ProcessingsHelper
  def filter_analyses(analysises, typename)
    analysises.select { |analysis| analysis.typename == typename.to_s }
  end
end
