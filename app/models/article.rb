class Article < ApplicationRecord
  belongs_to  :user
  has_many    :comments 
  validates :title , {presence: true , uniqueness: true }
  validates :body , {presence: true , length: {minimum: 20}}
  before_save :set_visits_count
  # before_save
  # before_vaidation
  # after_create
  # after_save
  def update_visits_count
    self.save if self.visits_count.nil?
    self.update(visits_count: self.visits_count + 1)
  end
  private
  def set_visits_count
    self.visits_count ||= 0;
  end

end
