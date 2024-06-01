class Pooh < ApplicationRecord
    belongs_to :user
    mount_uploader :image, ImageUploader

# image_topメソッドとimagesメソッドを使用できるようにする。


has_many_attached :images

has_many :tweet_tag_relations, dependent: :destroy
has_many :tags, through: :tweet_tag_relations, dependent: :destroy

end
