# frozen_string_literal: true

# Analysises Job
class AnalysisesJob < ApplicationJob
  queue_as :default

  def perform(processing)
    Analysis::AVAILABLE_ANALYSES.each do |analysis|
      AnalysisJob.perform_later(processing, analysis.to_s, processing.user)
    end
  end
end
