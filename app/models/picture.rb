class Picture < ApplicationRecord
  belongs_to :user
  mount_uploader :photo, PhotoUploader
  has_many :comments
end
