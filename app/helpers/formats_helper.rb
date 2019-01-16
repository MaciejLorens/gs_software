module FormatsHelper

  def date_format(date)
    return '' if date.blank?

    date.strftime('%Y-%m-%d')
  end

  def datetime_format(date)
    return '' if date.blank?

    date.strftime('%Y-%m-%d %H:%M')
  end

end