class Image < ActiveRecord::Base
  has_many :ideas_image
  has_many :ideas, through: :ideas_image
end
