class Task < ActiveRecord::Base
  belongs_to :users

  validates :name, presence: true
  validates :description, presence: true
  validates :user_id, presence: true

end
