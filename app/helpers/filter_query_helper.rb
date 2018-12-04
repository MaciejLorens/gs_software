module FilterQueryHelper

  def filter_query
    query = "created_at >= '#{created_at_from}' AND created_at <= '#{created_at_to_value}'"

    if params[:f_number].present?
      query += " AND number LIKE '%#{params[:f_number]}%'"
    end

    if params[:f_car_number].present?
      query += " AND car_number LIKE '%#{params[:f_car_number]}%'"
    end

    if params[:f_semitrailer_number].present?
      query += " AND semitrailer_number LIKE '%#{params[:f_semitrailer_number]}%'"
    end

    if params[:f_driver_id].present?
      query += " AND driver_id = #{params[:f_driver_id]}"
    end

    if params[:f_product_id].present?
      query += " AND product_id = #{params[:f_product_id]}"
    end

    if params[:f_user_id].present?
      query += " AND user_id = #{params[:f_user_id]}"
    end

    query
  end

  def created_at_from
    if params[:f_created_at_from].present?
      params[:f_created_at_from].to_date.beginning_of_day
    else
      1.month.ago.beginning_of_day
    end
  end

  def created_at_to_value
    if params[:f_created_at_to].present?
      params[:f_created_at_to].to_date.end_of_day
    else
      Date.today.end_of_day
    end
  end

end
