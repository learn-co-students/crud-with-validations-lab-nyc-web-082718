class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, inclusion: {in: [true, false]}
  validates :artist_name, presence: true
  validate :optional_release_year
  validate :forbid_double_release
  validate :impossible_release_year


  def optional_release_year
    if released == true && release_year == nil
      errors.add(:release_year, "must have a release year if officially released.")
    end
  end

  def forbid_double_release
    if Song.all.any? do |song|
      song.title == title && song.artist_name == artist_name && song.release_year == release_year
      end
      errors.add(:title, "the same artist canot release the same title in one year.")
    end
  end

  def impossible_release_year
    if release_year.to_i > Time.now.year.to_i
      errors.add(:release_year, "unable to release titles in the future.")
    end
  end

end
