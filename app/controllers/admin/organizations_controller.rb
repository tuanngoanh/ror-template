require 'app_utils'

class Admin::OrganizationsController < Admin::AdminController
  before_action :get_school
  before_action :init_item, :except => [:new, :create]

  def new
    @organization = Organization.new(:school_id => @school.id,
                                     :web_address => @school.web_address,
                                     :phone => @school.phone,
                                     :address => @school.address,
                                     :city => @school.city,
                                     :state_id => @school.state_id,
                                     :zip => @school.zip,
                                     :country_id => @school.country_id)
  end

  def create
    @organization = Organization.new(params_organization)
    @organization.school_id = @school.id
    if @organization.valid?
      @organization.save
      flash[:success] ='Created successfully!'
      redirect_to edit_school_path(@school.slug, :tab => School::EDIT_TAB_NAMES[:organizations])
    else
      render :new
    end
  end

  def edit
    add_breadcrumb 'Dashboard', edit_school_path(@school.slug, :tab => School::EDIT_TAB_NAMES[:organizations])
    add_breadcrumb 'Edit', edit_school_path(@school.slug, :tab => School::EDIT_TAB_NAMES[:organizations]), title: 'Organizations'

    @current_tab = params[:tab].blank? ? 'details' : params[:tab]
  end

  def update
    if @organization.update(params_organization)
      flash[:success] ='Updated successfully!'
      redirect_to edit_school_path(@school.slug, :tab => School::EDIT_TAB_NAMES[:organizations])
    end
  end

  def destroy
    if @organization.destroy
      flash[:success] ='Destroy successfully!'
    else
      flash[:error] ='Destroy failed!'
    end
    redirect_to edit_school_path(@school.slug, :tab => School::EDIT_TAB_NAMES[:organizations])
  end

  def student_list
    student_page = params[:student_page].to_i < 1 ? 1 : params[:student_page].to_i
    @student_page_size_name = 'students'
    @student_page_size_value = per_page(@student_page_size_name)
    @students = @organization.get_students.paginate(page: student_page, per_page: @student_page_size_value)

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def get_school
    @school = School.friendly.find(params[:school_id])
  end

  def init_item
    @organization = Organization.friendly.find(params[:id])
  end

  def params_organization
    params.require(:organization).permit(:name, :web_address, :address, :city, :state_id, :country_id, :zip, :phone)
  end
end
