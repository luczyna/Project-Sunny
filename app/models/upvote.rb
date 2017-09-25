class Upvote < ApplicationRecord
  belongs_to :idea
  belongs_to :user
  belongs_to :version
end
