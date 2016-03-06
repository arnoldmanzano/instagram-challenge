class Post < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  has_many :comments
  has_attached_file :image,
                    styles: { medium: '300x300>', thumb: '100x100>' },
                    default_url: '/images/:style/missing.png'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates_attachment :image,
                       presence: true,
                       size: { less_than: 2.megabytes }
end