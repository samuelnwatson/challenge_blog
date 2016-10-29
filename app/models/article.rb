class Article < ActiveRecord::Base
	validates :name, presence: true, length: { minimum: 5 }
	validates :content, presence: true, length: { minimum: 10 }
	has_many :comments, dependent: :destroy
end
