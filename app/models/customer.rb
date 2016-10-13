class Customer < ApplicationRecord

  default_scope { order(active: :desc, name: :asc) }
  scope :active, -> { where(active: true).order(:name) }
  scope :passive, -> { where(active: false).order(:name) }

  has_many :certificates
  accepts_nested_attributes_for :certificates
  has_many :attestats
  accepts_nested_attributes_for :attestats

  belongs_to :user

  validates_presence_of :name
  validates_uniqueness_of :name

end
