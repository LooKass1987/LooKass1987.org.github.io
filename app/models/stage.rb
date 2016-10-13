class Stage < ApplicationRecord

  default_scope { order(:resource_type, :resource_id, :operate_at) }
  scope :check, -> { where(operate: '@', passed_at: nil).order(:operate_at) }

  belongs_to :resource, polymorphic: true

  validates_presence_of :operate, :operate_at

  before_save :check_operate


  OPTIONS = {
      'Плановый': '@',
      'Возобновление': '+',
      'Остановка': '-',
      'Аннулирование': '!',
  }

  def plain?
    operate == '@'
  end

  def operation_value
    if operation.blank?
      plain? ? %(<span class="text-muted">#{I18n.t 'stage.inspection_control'}</span>).html_safe : '--'
    else
      operation
    end
  end

  def operate_await
    (operate_at - DateTime.now.to_date).to_i
  end

  def passed_at?
    now = DateTime.now.to_date
    plain? ? !passed_at.blank? && passed_at <= now : operate_at <= now
  end


  private

  def check_operate
    self.passed_at = nil unless self.plain?
  end

end
