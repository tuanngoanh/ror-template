class Airport < ApplicationRecord
  belongs_to :state, optional: true
  belongs_to :country, optional: true
  belongs_to :time_zone

  validates_presence_of :name, :code, :time_zone
  validates :code , length: { in: 1..3 }
  validates :code, uniqueness: { case_sensitive: false }

  extend FriendlyId
  friendly_id :code

  def address
    tmp = city
    tmp += ", #{state.name}" if state
    tmp += ", #{country.name}" if country
    return tmp
  end

  def timezone_name
    time_zone.name if time_zone.present?
  end

  def self.get_custom_name(airport)
    airport.present? ? "#{airport.name} (#{airport.code})" : 'Airport: TBD'
  end

  def self.get_custom_code(airport)
    airport.present? ? airport.code : 'Airport: TBD'
  end
end
