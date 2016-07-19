class Post < ActiveRecord::Base
  # acts_as_votable
  belongs_to :user
  has_attached_file :image, styles: { medium: "1200*900", small: "400*300>"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  belongs_to :category
  
  def do_like
    @post = self
    @post.like += 1
    @post.counter -= 1
    @post.save
  end

  def do_view
    self.counter += 1
    self.save
  end

  def random_post
    Post.where.not(id: self).order("RANDOM()").first
  end
  
  def other_random_post(random_post)
    Post.where.not(id: self && random_post).order("RANDOM()").first
  end
end
