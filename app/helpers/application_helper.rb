# frozen_string_literal: true

module ApplicationHelper
  def body_class
    @body_class || ''
  end

  def zero_padding(n, val)
    val.rjust(n, '0')
  end

  def label_value(val)
    val.blank? ? '--' : val
  end

  def date_label_format(date)
    date.present? ? date.strftime('%Y/%m/%d') : '--'
  end
end
