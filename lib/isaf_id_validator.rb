require 'normalize_country'

class IsafIdValidator < ActiveModel::EachValidator
  @@default_options = {}

  def self.valid?(value, options = {})
    value = value.to_s.upcase
    regexp = /^([A-Z]{3})([A-Z]{2})([1-9][0-9]*)$/

    data = regexp.match(value)

    if !data
      return false
    end

    NormalizeCountry.to_a(:ioc).include?(data[1])
  end

  def self.default_options
    @@default_options
  end

  def validate_each(record, attribute, value)
    options = @@default_options.merge(self.options)

    unless self.class.valid?(value, self.options)
      record.errors.add(attribute, options[:message] || :invalid)
    end
  end
end
