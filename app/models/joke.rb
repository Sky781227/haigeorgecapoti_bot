class Joke < ActiveRecord::Base
  validates :content, presence: true, uniqueness: true
  
  belongs_to :user
  
end
