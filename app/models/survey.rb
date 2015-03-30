class Survey < ActiveRecord::Base
  has_many :questions
  belongs_to :user
  has_many :responses
end
