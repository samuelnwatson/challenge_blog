class Article < ActiveRecord::Base
	validates :name, presence: true
	validates :content, presence: true, length: { minimum: 10 }
end
