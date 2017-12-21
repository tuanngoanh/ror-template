class State < ApplicationRecord
  belongs_to :country
  has_many :schools

  validates :abbr, presence: true, uniqueness: true
  validates_presence_of :name

  ##Methods
  def self.to_collection_of_select
    order(name: :desc).map { |e| [e.name, e.id] }
  end
end
