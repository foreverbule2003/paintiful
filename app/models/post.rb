class Post < ActiveRecord::Base
  acts_as_votable
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
end
