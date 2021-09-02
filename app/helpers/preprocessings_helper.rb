# frozen_string_literal: true

# Helper for preprocessing
module PreprocessingsHelper
  def redo_preprocess
    render partial: "redo_preprocess_button"
  end

  def preprocessing_duration(preprocessing)
    return "" if preprocessing.preprocessed_at.blank?

    distance_of_time_in_words(preprocessing.sent_to_preprocessing_at, preprocessing.preprocessed_at)
  end
end
