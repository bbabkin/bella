class Product < ActiveRecord::Base

	belongs_to :line
  acts_as_list :scope => :line

  before_validation :add_default_permalink
  after_save :touch_line
  mount_uploader :image, ImageUploader # Tells rails to use this uploader for this model.
  validates_presence_of :name
  validates_length_of :name, :maximum => 255
  # use presence_of with length_of to disallow spaces
  validates_presence_of :permalink
  validates_length_of :permalink, :within => 3..255
  # use presence_of with length_of to disallow spaces
  validates_uniqueness_of :permalink

  # for unique values by subject use ":scope => :subject_id"

  # scope :visible, lambda { where(:visible => true) }
  # scope :invisible, lambda { where(:visible => false) }
  scope :visible, lambda { where(:visible => true) }
  scope :sorted, lambda { order("products.position ASC")}
  scope :newest_first, lambda { order("products.created_at DESC")}
  scope :search, lambda {|query|
    where(["name LIKE ?", "%#{query}%"])
  }
  private

  def add_default_permalink
    if permalink.blank?
      self.permalink = "#{id}-#{name.parameterize}"
    end
  end

  def touch_line
    # touch is similar to:
    # subject.update_attribute(:updated_at, Time.now)
    line.touch
  end

end

