class Project < ApplicationRecord
  validates :project_name, presence: true
  validates :content, presence: true, length: { maximum: 200 }

  belongs_to :user
  has_many :comments, dependent: :destroy
end
