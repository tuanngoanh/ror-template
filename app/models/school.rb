class School < ApplicationRecord
  has_many :organizations, dependent: :destroy
  belongs_to :state
  belongs_to :country
  belongs_to :admin, class_name: 'User', optional: true

  ##Validation
  validates_presence_of :slug, :name, :address, :city, :state_id, :zip, :country_id
  validates :slug, uniqueness: { case_sensitive: false }

  extend FriendlyId
  friendly_id :name, use: :slugged

  before_save :update_school_info
  before_update :update_school_info

  EDIT_TAB_NAMES = {
      :details => 'details',
      :organizations => 'organizations',
      :students => 'students'
  }

  ##Methods
  def update_school_info
    begin
      if self.city && self.state
        coordinates = Geocoder.coordinates("#{self.address}, #{self.city}, #{self.state.name}")
        if(coordinates != nil && coordinates.length >= 2)
          self.latitude = coordinates[0]
          self.longitude = coordinates[1]
        else
          self.latitude = nil
          self.longitude = nil
        end
      end
    rescue Exception => e
      logger.info e.inspect
    end
  end

  def should_generate_new_friendly_id? #will change the slug if the name changed
    name_changed?
  end

  def self.to_collection_of_select
    order(name: :desc).pluck('name, name')
  end

  def get_students
    return User.where(:school => self.name)
  end
end
