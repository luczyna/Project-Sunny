class Version < ApplicationRecord
  belongs_to :idea

  validates :idea_id, presence: true
  validates :number, presence: true, uniqueness: { scope: :idea }

  validates :content,
    presence: { message: "We need an idea description." },
    length: { maximum: 500, message: "Please shorten your idea description." }

  validates :goal,
    presence: { message: "We need a summary of this idea."},
    length: { maximum: 75, message: "Please shorten this short pitch."}
end
