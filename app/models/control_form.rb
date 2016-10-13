class ControlForm

  include ActiveModel::Model
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :number

  validates_format_of :number,
                      with: /RU\.НЦСС\.([А-Я]{2}\.\d{3}|\d{3}\.\d{3}\.\d{1}\.[А-Я]{2}\.\d{5})/iu

end
