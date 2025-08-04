class Word < ApplicationRecord
  # Enum cho word_type field - sử dụng integer mapping
  enum word_type: {
    noun: 0,
    verb: 1,
    adjective: 2,
    adverb: 3,
    pronoun: 4,
    preposition: 5,
    conjunction: 6,
    interjection: 7
  }

  # Validations
  validates :content, presence: true
  validates :meaning, presence: true
  validates :word_type, presence: true, inclusion: { in: word_types.keys }

  # Scopes
  scope :by_type, ->(word_type) { where(word_type: word_type) }
  scope :recent, -> { order(created_at: :desc) }
end
