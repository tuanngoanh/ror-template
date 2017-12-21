class Admin::AdminController < ApplicationController
  layout 'admin'
  before_action :authenticate_user!

  include RescueFromInApp

  def per_page(page_size_name = nil, min_page_size = nil)
    per_page = (
    if page_size_name && cookies[page_size_name + '_per_page'] then
      cookies[page_size_name + '_per_page']
    else
      min_page_size.nil? ? MIN_PAGE_SIZE : min_page_size
    end).to_i
  end

  def get_state_from_country
    country_id = params[:country_id]
    state_list = State.where(:country_id => country_id).order(name: :asc)
    return render json: state_list.to_json
  end

  private

  def authenticate_user!
    if user_signed_in?
      if !current_user.staff
        redirect_to root_path
      else
        super
      end
    else
      redirect_to root_path, notice: 'You are not authenticated to access this page!'
    end
  end
end
