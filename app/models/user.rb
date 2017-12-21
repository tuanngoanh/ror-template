class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable,  :confirmable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def search_data
      attributes.except!('current_sign_in_ip', 'last_sign_in_ip', 'last_sign_in_at',
                         'current_sign_in_at', 'remember_created_at', 'reset_password_token', 'encrypted_password',
                         'sign_in_count', 'confirmation_sent_at', 'unconfirmed_email', 'confirmed_at', 'confirmation_token',
                         'remember_token', 'reset_password_sent_at', 'id')
  end

  ## Relations
  has_many :schools, :foreign_key => 'admin_id'

  ##Validations
  validates_presence_of :first_name, :last_name, :email, :phone
  validates :first_name, length: { maximum: 255, too_long: '%{count} characters is the maximum allowed' }
  validates :middle_name, length: { maximum: 255, too_long: '%{count} characters is the maximum allowed' }
  validates :last_name, length: { maximum: 255, too_long: '%{count} characters is the maximum allowed' }

  ## Scope
  scope :users, -> { where(staff: false) }
  scope :staffs, -> { where(staff: true) }
  scope :customers, -> {where('staff = false and order_count > 0')}
  scope :no_purchases, -> {where('staff = false and order_count = 0')}

  SHOW_TAB_NAMES = {
      :trips => 'trips',
      :contact => 'emergency_contact',
      :history => 'history',
      :edit_profile => 'edit_profile',
  }

  def short_name
    "#{self.first_name} #{self.last_name}"
  end

  def name
    "#{self.first_name} #{self.middle_name} #{self.last_name}"
  end

  def profile_image_link
    if avatar.present?
      return avatar + '/convert?w=35&h=35' if avatar['filepicker']
      return avatar.gsub('?type=large', '') + '?type=square' if avatar['facebook']
    end
    ActionController::Base.helpers.asset_path('admin/profile-avatar.jpg')
  end

  def update_information(phone = nil, school = nil, organization = nil)
    self.phone = phone unless phone.blank?
    self.school = school unless school.blank?
    self.organization = organization unless organization.blank?
    self.save!
  end
end
