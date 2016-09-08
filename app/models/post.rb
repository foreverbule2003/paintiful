class Post < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "1200*900", small: "400*300>"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  belongs_to :category
  belongs_to :user
  validates :title, presence: true
  validates :description, length: { maximum: 140 }
  
  scope :recent, -> { order("created_at DESC") }

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
