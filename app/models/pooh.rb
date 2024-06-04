class Pooh < ApplicationRecord
    belongs_to :user
    mount_uploader :image, ImageUploader

# image_topメソッドとimagesメソッドを使用できるようにする。


has_many_attached :images

has_many :pooh_tag_relations, dependent: :destroy
has_many :tags, through: :pooh_tag_relations, dependent: :destroy

end
