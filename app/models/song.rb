class Song < ActiveRecord::Base

  def date_cannot_be_in_the_future
    if release_year.present? && release_year > Date.today.year
      errors.add(:release_year, "can't be in the future")
    end
  end

  def must_have_release_year
    if released == true && release_year.nil?
      errors.add(:release_year, "must have release year")
    end
  end

  validates :title, presence: true, uniqueness: true
  validates :released, inclusion: {in: [true, false]}
  validates :artist_name, presence: true
  validate :date_cannot_be_in_the_future
  validate :must_have_release_year

end
