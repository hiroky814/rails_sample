# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.join_date(month, date)
    return if month.blank?

    if date.present?
      "#{month.tr('-', '/')}/#{format('%02d', date.to_i)}"
    else
      month.tr('-', '/').to_s
    end
  end
end
