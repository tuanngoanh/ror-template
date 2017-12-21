class Admin::SchoolsController < Admin::AdminController
  before_action :init_item, :except => [:index, :new, :create]
  before_action :get_associated_collection, only: [:new, :create, :edit, :update]
  add_breadcrumb 'Dashboard', :schools_path

  def index
    add_breadcrumb 'Index', schools_path, :title => 'Schools'

    @key_search = params[:q]
    @schools = School.paginate(page: params[:page], per_page: per_page)
    if @key_search.present?
      @schools = @schools.where('name ILIKE :search OR slug ILIKE :search OR address ILIKE :search', search: AppUtils.key_search(@key_search))
    end
  end

  def new
    @school = School.new(:country => Country.first)
  end

  def create
    @school = School.new(params_school)
    if @school.valid?
      @school.save
      flash[:success] ='Created successfully!'
      redirect_to schools_path
    else
      render :new
    end
  end

  def edit
    add_breadcrumb 'Edit', schools_path, :title => 'Schools'
    @current_tab = params[:tab] || School::EDIT_TAB_NAMES[:details]

    if @current_tab == School::EDIT_TAB_NAMES[:details]
      @admins = User.staffs.order('first_name, last_name')
    elsif @current_tab == School::EDIT_TAB_NAMES[:organizations]
      organization_page = params[:organization_page].to_i < 1 ? 1 : params[:organization_page].to_i
      @organization_page_size_name = 'organizations'
      @organization_page_size_value = per_page(@organization_page_size_name)
      @organizations = @school.organizations.paginate(page: organization_page, per_page: @organization_page_size_value)
    elsif @current_tab == School::EDIT_TAB_NAMES[:students]
      student_page = params[:student_page].to_i < 1 ? 1 : params[:student_page].to_i
      @student_page_size_name = 'students'
      @student_page_size_value = per_page(@student_page_size_name)
      @students = @school.get_students.paginate(page: student_page, per_page: @student_page_size_value)
    elsif @current_tab == School::EDIT_TAB_NAMES[:airports]
      airport_page = params[:airport_page].to_i < 1 ? 1 : params[:airport_page].to_i
      @airport_page_size_name = 'airports'
      @airport_page_size_value = per_page(@airport_page_size_name)
      @departure_airports = @school.departure_airports.paginate(page: airport_page, per_page: @airport_page_size_value)
    elsif @current_tab == School::EDIT_TAB_NAMES[:payment_plans_and_deposits]
      @event_id = params[:event_id]
      @event = Event.find_by_id(@event_id)
      @events = []

      if @event.present?
        @events = [['Select an event...', nil]]

        @payment_plans = @event.layaway_date_ranges.main_order_type
                             .where(:school_id => @school.id)
                             .order('start_date ASC')

        @deposit_payment_plans = @event.layaway_date_ranges.deposit_type
                                     .where(:school_id => @school.id)
                                     .order('start_date ASC')

        @deposit_date_ranges = @event.deposit_date_ranges
                                       .where(:school_id => @school.id)
                                       .order(start_date: :asc)
      end

      layaway_event_ids = LayawayDateRange.where(:school_id => @school.id).distinct.pluck(:event_id)
      deposit_event_ids = DepositDateRange.where(:school_id => @school.id).distinct.pluck(:event_id)
      @events += Event.where('id IN (?) OR id IN (?)', layaway_event_ids, deposit_event_ids).distinct.pluck(:name, :id)
    end
  end

  def update
    if @school.update(params_school)
      flash[:success] ='Updated successfully!'
      redirect_to schools_path
    end
  end

  def destroy
    if @school.destroy
      flash[:success] ='Destroyed successfully!'
    else
      flash[:error] ='Destroy failed!'
    end
    redirect_to schools_path
  end

  private

  def init_item
    @school = School.friendly.find(params[:id])
  end

  def get_associated_collection
    @admins_collection ||= User.staffs.pluck("concat(first_name, ' ', last_name), id")
  end

  def params_school
    params.require(:school).permit(:name, :phone, :web_address, :address, :city, :state_id, :country_id, :admin_id, :zip)
  end
end
