class Article < ApplicationRecord

  default_scope { order(published: :desc, published_at: :desc, header: :asc) }
  scope :recent, -> (num) { order(created_at: :desc).limit(num) }
  scope :draft, -> { where(published: false).order(published_at: :desc, header: :asc) }
  scope :published, -> { where(published: true).order(published_at: :desc, header: :asc) }

  mount_uploader :banner, ArticleUploader

  validates_presence_of :header, :content

  before_save :check_attributes

  paginates_per 10

  def to_s
    "#{I18n.t 'activerecord.models.article'} ##{id}"
  end

  def name
    to_s
  end


  private

  def check_attributes
    self.published_at = DateTime.now if self.published && self.published_at.blank?
  end

end
