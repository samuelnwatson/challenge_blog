class Article < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 5 }
  validates :content, presence: true, length: { minimum: 10 }
  has_many :comments, dependent: :destroy

  belongs_to :users

  after_save :notify_subcribers

  protected

  def notify_subcribers
    @subscribers = User.get_subscribers

    @subscribers.each do |user|
      @user_email = user.email
      SendNotifications.later(@user_email, @article)
    end
  end
  
end
