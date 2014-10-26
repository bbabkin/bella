class Line < ActiveRecord::Base
	has_many :products
  acts_as_list
  before_validation :add_default_permalink
  validates_presence_of :name
  validates_length_of :name, :maximum => 255
  validates_presence_of :permalink
  validates_length_of :permalink, :within => 3..255
  validates_uniqueness_of :permalink
  scope :visible, lambda { where(:visible => true) }
  scope :invisible, lambda { where(:visible => false)}
  scope :sorted, lambda { order("lines.position ASC")}
  scope :newest_first, lambda { order("lines.created_at DESC")}
  scope :search, lambda {|query|
    where(["name LIKE ?", "%#{query}%"])
  }
  private
  def add_default_permalink
    if permalink.blank?
      self.permalink = "#{id}-#{name.parameterize}"
    end
  end 
end
