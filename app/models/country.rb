class Country < ApplicationRecord
  has_many :states
  has_many :schools

  validates :name, presence: true, uniqueness: true

  #Methods
  def self.to_collection_of_select
    order(name: :desc).pluck('name, id')
  end

  def self.to_group_with_collection
    self.includes(:states).map do |c|
      [c.name, c.states.map do |s|
        [s.name, s.id, {'data-subtext'=> s.abbr}]
      end
      ]
    end
  end
end
