require 'app_utils'

class HomeController < ApplicationController
  include ActionView::Helpers::NumberHelper
  before_action :authenticate_user!, :only => [:profile]

  def index

  end

  def get_organizations_from_school
    school = School.find_by(:name => params[:school_id])
    organizations = school.present? ? school.organizations.order(name: :asc) : []
    return render json: organizations.to_json
  end

  def profile

  end

end
