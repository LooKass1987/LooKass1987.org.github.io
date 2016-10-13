ActiveAdmin.register Stage do
  menu parent: 'Utils', priority: 8, label: proc { I18n.t('active_admin.stages') }

  actions :all, except: [:new, :show, :edit]

  permit_params :operation, :operation_at


  scope :all, default: true
  scope(:certificate) { |scope| scope.where(resource_type: Certificate) }
  scope(:attestat) { |scope| scope.where(resource_type: Attestat) }

  index do
    selectable_column
    id_column
    column :resource, class: 'h-size--20'
    column :operate_at, class: 'h-size--datetime'
    column :operate, class: 'h-size--10' do |model|
      Stage::OPTIONS.key model.operate
    end
    column :passed_at, class: 'h-size--10' do |model|
      status_tag model.passed_at?
    end
    column :operation do |model|
      model.operation_value
    end
    column :created_at
    actions class: 'h-size--actions--short'
  end

  filter :operate_at
  filter :operate, as: :select, collection: Stage::OPTIONS.to_a,
         input_html: {class: 'custom-select'}
  filter :operation
  filter :created_at
end
