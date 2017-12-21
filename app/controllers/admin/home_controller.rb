class Admin::HomeController < Admin::AdminController
  skip_before_action :authenticate_user!
  def index
   unless current_user && current_user.staff
    redirect_to root_path
   end
   @new_orders = 100
   @total_registrations = User.where(staff: false, active: true).count
  end

  def get_state_from_country
    country_id = params[:country_id]
    state_list = State.where(:country_id => country_id).order(name: :asc)
    return render json: state_list.to_json
  end

  def search_products
    @key_search = AppUtils.escape_elastic_search_query(params[:q])
    page = params[:page].to_i < 1 ? 1 : params[:page].to_i
    @page_size_name = 'products'
    @page_size_value = per_page(@page_size_name)
    if @key_search.blank?
      @products = Product.paginate(page: page, per_page: @page_size_value)
    else
      @products = Product.where("name ilike '%#{@key_search}%'")
                              .paginate(page: page, per_page: @page_size_value)
    end
  end


  def search_all
    q = params[:q] || ''
    data = q.strip.split(":")
    prefix = data.count > 1 ? data[0].strip : ''
    query_param = data.count > 1 ? data[1].strip : data[0]
    puts prefix.inspect
    case prefix.upcase
      when 'SCHOOL', 'SCHOOLS'
        redirect_to schools_path(:q => query_param)
      when 'ORDER', 'ORDERS'
        redirect_to orders_path(:q => query_param)
      when 'EVENT', 'EVENTS'
        redirect_to events_path(:q => query_param)
      when 'VENDOR', 'VENDORS'
        redirect_to vendors_path(:q => query_param)
      when 'PROMOTION', 'PROMOTIONS', 'PROMO', 'PROMOS'
        redirect_to promo_codes_path(:q => query_param)
      when 'PAGE', 'PAGES'
        redirect_to static_pages_path(:q => query_param)
      when 'PRODUCT', 'PRODUCTS'
        redirect_to search_products_path(:q => query_param)
      when 'AIRPORT', 'AIRPORTS'
        redirect_to airports_path(:q => query_param)
      when 'AIRLINE', 'AIRLINES'
        redirect_to airlines_path(:q => query_param)
      else
      redirect_to users_path(:q => query_param)
    end
  end
end