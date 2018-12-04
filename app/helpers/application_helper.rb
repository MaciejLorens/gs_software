module ApplicationHelper

  def date_format(date)
    date.strftime('%Y-%m-%d %H:%M')
  end

  def sort_class(field)
    params[:s_field] == field ? params[:s_order] : ''
  end
end
