# frozen_string_literal: true


class AnalysisesJob < ApplicationJob
  queue_as :default

  def perform(processing)
    Processing::ANALYSISES.each do |analysis|
      AnalysisJob.perform_later(processing, analysis.to_s)
    end
  end
end
