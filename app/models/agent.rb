class Agent < ApplicationRecord

  default_scope { order(active: :desc, role: :asc, name: :asc) }
  scope :active, -> { where(active: true).order(:role, :name) }
  scope :passive, -> { where(active: false).order(:role, :name) }
  scope :certification, -> { where(role: 0).order(:name) }
  scope :accreditation, -> { where(role: 1).order(:name) }

  has_many :certificates
  accepts_nested_attributes_for :certificates
  has_many :attestats
  accepts_nested_attributes_for :attestats

  belongs_to :user

  validates_presence_of :name
  validates_uniqueness_of :name

  before_save :check_roles

  ROLES = {
      'Орган серификации': 0,
      'Орган аккредитации': 1,
  }

  private

  def check_roles
    self.role = 0 unless ROLES.has_value? self.role
  end

end
