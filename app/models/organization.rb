class Organization < ApplicationRecord
  belongs_to :school
  belongs_to :state
  belongs_to :country

  validates_presence_of :slug, :name, :address, :city, :state_id, :zip, :country
  validates_uniqueness_of :slug, case_sensitive: false , scope: :school_id

  extend FriendlyId
  friendly_id :name, use: :slugged

  before_save :update_organization_info
  before_update :update_organization_info

  EDIT_TAB_NAMES = {
      :details => 'details',
  }

  def update_organization_info
    begin
      #find lat and long value
      if self.city && self.state
        coordinates = Geocoder.coordinates("#{self.address}, #{self.city}, #{self.state.name}")
        if(coordinates != nil && coordinates.length >= 2)
          self.latitude = coordinates[0]
          self.longitude = coordinates[1]
        else
          self.latitude = nil
          self.longitude = nil
          #raise "Cannot find lat & long value from your location. Please update your city and state!"
        end
      end
    rescue

    end
  end

  def should_generate_new_friendly_id? #will change the slug if the name changed
    name_changed?
  end

  def self.to_collection_of_select
    order(name: :desc).pluck('name, name')
  end

  def get_students
    return User.where(:school => self.school.name, :organization => self.name)
  end

  def get_students_without_school
    return User.where(:organization => self.name)
  end
end
