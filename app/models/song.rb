class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, year: true, :if => :condition_released?
  validates :artist_name, presence: true

  def condition_released?
    released == true
  end
end
