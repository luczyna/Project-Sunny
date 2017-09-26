class PublishedIdeaLimiterValidator < ActiveModel::Validator
  def validate(idea_record)
    if idea_record.published == true && count_users_published_ideas(idea_record.user_id) == 5
      idea_record.errors[:base] << 'You can only have 5 published ideas. Choose one to unpublish.'
    end
  end

  private
  def count_users_published_ideas(user)
    # get the count of the number of ideas a user has that are published
    Idea.where(user_id: user, published: true).count
  end
end

class Idea < ApplicationRecord
  belongs_to :user
  has_many :versions, dependent: :destroy
  has_many :upvotes, through: :versions

  validates :name, presence: true, uniqueness: { scope: :user }
  validates :user_id, presence: true
  validates_associated :versions

  # we will want to validate that
  # a user has at most 5 published ideas
  validates_with PublishedIdeaLimiterValidator
end
