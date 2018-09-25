class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {scope: %i[release_year artist_name]}
  validates :released, inclusion: {in: [true, false]}
  validates :artist_name, presence: true

  with_options if: :released? do |s|
    s.validates :release_year, presence: true
    s.validates :release_year, numericality: {less_than_or_equal_to: Date.today.year}
  end

  def released?
    released
  end

end
