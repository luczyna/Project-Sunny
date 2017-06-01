class Idea < ApplicationRecord
  belongs_to :user
  has_many :versions

  validates_presence_of :name
  # we will want to validate that a user has at most 5 published ideas
  validates_with PublishedIdeaLimiterValidator
end

class PublishedIdeaLimiterValidator < ActiveModel::Validator
  def validate(idea_record)
    if count_users_published_ideas(idea_record.user) == 5
      idea_record.errors[:base] << 'You can only have 5 published ideas. Choose one to unpublish.'
  end

  private
  def count_users_published_ideas(user)
    # get the count of the number of ideas a user has that are published
    Idea.where(user: user).only(published: true).count
  end
end  
