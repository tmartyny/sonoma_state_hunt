class Challenge < ActiveRecord::Base
  has_many :submissions
  validates :clue, 
            :lat, 
            :lon, 
            :name, 
            :points, 
            :direction,
            presence: true
  validates :points, :lat, :lon, numericality: true
  
  def next
    self.class.where("id > ?", id).first
  end

  def previous
    self.class.where("id < ?", id).last
  end

  def self.final_challenge_id
    Challenge.last.id
  end
end
