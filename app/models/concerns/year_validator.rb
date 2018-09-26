class YearValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value
      unless value && value <= Time.new.year
        record.errors.add(attribute, "can't be from the future")
      end
    end
  end
end
