module Document
  extend ActiveSupport::Concern

  included do

    scope :recent, -> (num) { order(created_at: :desc).limit(num) }
    scope :active, -> { where(active: true) }
    scope :draft, -> { where(status: 0) }
    scope :continue, -> { where(status: 1) }
    scope :resume, -> { where(status: 2) }
    scope :close, -> { where(status: -1) }
    scope :suspend, -> { where(status: -2) }
    scope :cancel, -> { where(status: -3) }

    belongs_to :customer
    belongs_to :agent

    has_many :stages, as: :resource,
             dependent: :destroy
    accepts_nested_attributes_for :stages,
                                  allow_destroy: true

    validates_presence_of :number
    validates_uniqueness_of :number

    after_save :status_check

  end


  STATUS = {
      'Черновик': 0,
      'Действует': 1,
      'Возобновлён': 2,
      'Окончен': -1,
      'Остановлен': -2,
      'Аннулирован': -3,
  }

  def to_s
    number.to_s
  end

  def status_value
    STATUS.key status
  end

  def status_check
    now = DateTime.now.to_date
    if self.issued_at.blank? || self.issued_at > now
      status = 0
    elsif !self.closed_at.blank? && self.closed_at <= now
      status = -1
    else
      status = 1
      for stage in self.stages do
        if stage.operate_at <= now
          case stage.operate
            when '+'
              if status == -2
                status = 2
              else
                status = 0
                break
              end
            when '-'
              if status > 0
                status = -2
              else
                status = 0
                break
              end
            when '!'
              status = -3
          end
        end
      end
    end
    if self.status != status
      self.status = status
      self.save
    end
  end

  def stages_check
    done = 0
    if self.status > 0 && !self.agent.blank? && !self.agent.user.blank?
      for stage in self.stages.check do
        if stage.operate_await < 30
          done += 1 if StageMailer.stage_notify(stage).deliver
        end
      end
    end
    done
  end


  module ClassMethods

    def inspection
      done = 0
      self.all.each do |model|
        done += 1 if model.status_check
      end
      done
    end

    def feedback
      done = 0
      self.active.each do |model|
        done += model.stages_check
      end
      done
    end

  end

end
