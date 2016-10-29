class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :poster, class_name: "User"
  validates :text, presence: true
  scope :persisted, lambda { where.not(id: nil) }
end
