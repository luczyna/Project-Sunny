class Version < ApplicationRecord
  belongs_to :idea

  # validates_uniqueness_of :number, scope => :idea
  # validates :number, uniqueness: { scope: :idea }
  
  validates_presence_of :content, message: "We need an idea description."
  validates_length_of :content, maximum: 500, message: "Please shorten your idea description."

  validates_presence_of :goal, message: "We need a summary of this idea."
  validates_length_of :goal, maximum: 75, message: "Please shorten this short pitch."
end
