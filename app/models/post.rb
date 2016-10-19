class Post < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "1200*900", small: "400*300>"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  belongs_to :category
  belongs_to :user
  validates :title, presence: true, length: { maximum: 150 }
  validates :description, length: { maximum: 150 }  
  scope :recent, -> { order("created_at DESC") }
  has_many :post_collections, dependent: :destroy
  has_many :tools, dependent: :destroy
  accepts_nested_attributes_for :tools, reject_if: :all_blank, allow_destroy: true
  has_many :steps, dependent: :destroy
  accepts_nested_attributes_for :steps, reject_if: :all_blank, allow_destroy: true
  searchkick
  acts_as_votable
  
  def do_like
    self.like += 1
    self.save
  end

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
