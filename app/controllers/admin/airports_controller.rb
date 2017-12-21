require 'app_utils'

class Admin::AirportsController < Admin::AdminController
  before_action :init_item, :except => [:index, :new, :create]
  before_action :get_associated_collection, only: [:new, :create, :edit, :update]
  add_breadcrumb 'Dashboard', :airports_path

  # GET /airports
  def index
    add_breadcrumb 'Index', airports_path, title: 'Airports'

    @key_search = AppUtils.escape_elastic_search_query(params[:q])
    page = params[:page].to_i < 1 ? 1 : params[:page].to_i
    @page_size_name = 'airports'
    @page_size_value = per_page(@page_size_name)

    if @key_search.blank?
      @airports = Airport.order(name: :asc).includes(:state).paginate(page: page, per_page: @page_size_value)
    else
      @airports = Airport.order(name: :asc).includes(:state).where("name ilike '%#{@key_search}%'
                                                                    or code ilike '%#{@key_search}%'
                                                                    or city ilike '%#{@key_search}%'")
                                                              .paginate(page: page, per_page: @page_size_value)
    end
  end

  # GET /airports/new
  def new
    @airport = Airport.new(:country => Country.first)
  end

  # GET /airports/1/edit
  def edit

  end

  # POST /airports
  def create
    @airport = Airport.new(airport_params)
    if @airport.valid?
      @airport.save
      flash[:success] ='Created successfully!'
      redirect_to airports_path
    else
      render :new
    end
  end

  # PATCH/PUT /airports/1
  def update
    if @airport.update(airport_params)
      flash[:success] ='Updated successfully!'
      redirect_to airports_path
    else
      render :edit
    end
  end

  # DELETE /airports/1
  def destroy
    if @airport.destroy
      flash[:success] ='Destroyed successfully!'
    else
      flash[:error] ='Destroy failed!'
    end
    redirect_to airports_path
  end

  private

    def init_item
      @airport = Airport.friendly.find(params[:id])
    end

    def get_associated_collection
      @time_zones = TimeZone.all.order(:name)
    end

    def airport_params
      params.require(:airport).permit(:name, :code, :time_zone, :city, :state_id, :country_id, :time_zone_id) if params[:airport]
    end
end
