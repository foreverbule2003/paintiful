class Post < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :post_collections, dependent: :destroy
  has_many :tools, dependent: :destroy
  accepts_nested_attributes_for :tools, reject_if: :all_blank, allow_destroy: true
  has_many :steps, dependent: :destroy
  accepts_nested_attributes_for :steps, reject_if: :all_blank, allow_destroy: true
  validates :title, presence: true, length: { maximum: 140 }
  validates :description, length: { maximum: 140 }  

  has_attached_file :image, styles: { medium: "1200*900", small: "400*300>"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  scope :recent, -> { order("updated_at DESC") }
  
  searchkick
  acts_as_votable

  def do_view
    self.counter ||= 0
    self.counter += 1
    self.save
  end

  def random_post
    Post.where.not(id: self).sample()
  end
  
  def other_random_post(random_post)
    Post.where.not(id: self && random_post).sample()
  end


end
