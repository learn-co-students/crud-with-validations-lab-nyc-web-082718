class Song < ActiveRecord::Base

    validates :title, presence: true, uniqueness: true
    validates :released, inclusion: {in: [true, false]}
    validates :artist_name, presence: true
    validate :date_cant_be_in_the_future
    validate :needs_release_year

    def date_cant_be_in_the_future
      if release_year.present? && release_year > Date.today.year
        errors.add(:release_year, "can't be in the future")
      end
    end

    def needs_release_year
      if released == true && release_year.nil?
        errors.add(:release_year, "must have release year")
      end
    end

end
