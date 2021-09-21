# frozen_string_literal: true

json.array! @processings, partial: "processings/processing", as: :processing
