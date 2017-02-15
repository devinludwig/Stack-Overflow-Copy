class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  validates :content, :presence => true
end
