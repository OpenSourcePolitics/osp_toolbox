# frozen_string_literal: true

json.array! @analyses, partial: "analyses/analysis", as: :analysis
