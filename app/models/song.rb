class Song < ActiveRecord::Base
  validates :title, presence: true
  validates_uniqueness_of :artist_name, :scope => :release_year
  validates :release_year, presence: true, if: :released
  validate :date_not_from_future

  def date_not_from_future
    if release_year && release_year > Date.today.year
      errors.add(:release_year, "Can't be from the future!")
    end
  end

end
