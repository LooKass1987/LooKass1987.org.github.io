class Partner < ApplicationRecord

  default_scope { order(published: :desc, index: :asc, name: :asc) }
  scope :draft, -> { where(published: false).order(:index, :name) }
  scope :published, -> { where(published: true).order(:index, :name) }

  mount_uploader :logotype, PartnerUploader

  validates_presence_of :name
  validates_uniqueness_of :name

  paginates_per 5

end
