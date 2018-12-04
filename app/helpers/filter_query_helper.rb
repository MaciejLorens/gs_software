module FilterQueryHelper

  def filter_query(default_field = nil)
    query = "hidden = false"

    if params[:f_created_at_from].present? || default_field == :created_at
      value = params[:f_created_at_from].try(:to_date) || 1.month.ago
      query += " AND created_at >= '#{value.beginning_of_day}'"
    end

    if params[:f_created_at_to].present? || default_field == :created_at
      value = params[:f_created_at_to].try(:to_date) || Date.today
      query += " AND created_at <= '#{value.end_of_day}'"
    end

    if params[:f_email].present?
      query += " AND email LIKE '%#{params[:f_email]}%'"
    end

    if params[:f_first_name].present?
      query += " AND first_name LIKE '%#{params[:f_first_name]}%'"
    end

    if params[:f_last_name].present?
      query += " AND last_name LIKE '%#{params[:f_last_name]}%'"
    end

    if params[:f_address].present?
      query += " AND address LIKE '%#{params[:f_address]}%'"
    end

    if params[:f_postcode].present?
      query += " AND postcode LIKE '%#{params[:f_postcode]}%'"
    end

    if params[:f_city].present?
      query += " AND city LIKE '%#{params[:f_city]}%'"
    end

    if params[:f_country].present?
      query += " AND country LIKE '%#{params[:f_country]}%'"
    end

    if params[:f_name].present?
      query += " AND name LIKE '%#{params[:f_name]}%'"
    end

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

end
