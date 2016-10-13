ActiveAdmin.register Attestat do
  menu priority: 4, label: proc { I18n.t 'active_admin.attestats' }

  permit_params :active,
                :number, :object,
                :issued_at, :closed_at,
                :customer_id, :agent_id,
                stages_attributes: [:id,
                                    :operate, :operate_at, :operation, :passed_at,
                                    :_destroy]

  includes :customer, :agent, :stages


  scope :all, default: true
  scope :continue
  scope :resume
  scope :close
  scope :suspend
  scope :cancel
  scope :draft

  index do
    selectable_column
    id_column
    column :active, class: 'h-size--boolean'
    column(:status, class: 'h-size--boolean') { |model| model.status_value }
    column :number, class: 'h-size--10'
    column :object
    column :customer, class: 'h-size--10'
    column :agent, class: 'h-size--10'
    column :created_at
    actions
  end

  index as: :table_alter do
    selectable_column
    id_column
    column :active, class: 'h-size--boolean'
    column(:status, class: 'h-size--boolean') { |model| model.status_value }
    column :number, class: 'h-size--10'
    column :object
    column :issued_at, class: 'col-datatime'
    column :closed_at, class: 'col-datatime'
    actions
  end

  filter :active, input_html: {class: 'custom-select'}
  filter :number
  filter :object
  filter :customer, input_html: {class: 'custom-select'}
  filter :agent, input_html: {class: 'custom-select'}
  filter :created_at

  batch_action :active, priority: 1 do |ids|
    batch_action_collection.find(ids).each do |model|
      model.update active: true unless model.active
    end
    redirect_to collection_path, alert: t('active_admin.batch_actions.alerts.active')
  end

  batch_action :deactive, priority: 2 do |ids|
    batch_action_collection.find(ids).each do |model|
      model.update active: false if model.active
    end
    redirect_to collection_path, alert: t('active_admin.batch_actions.alerts.deactive')
  end


  show do
    attributes_table do
      # row :number
      row :object
      row :issued_at
      row :closed_at
      row :customer
      row :agent
    end
    panel 'Этапы' do
      table_for resource.stages do
        column :operate_at, class: 'h-size--10'
        column :operate, class: 'h-size--10' do |model|
          Stage::OPTIONS.key model.operate
        end
        column :passed_at, class: 'h-size--10' do |model|
          status_tag model.passed_at?
        end
        column :operation do |model|
          model.operation_value
        end
      end
    end unless resource.stages.empty?
    active_admin_comments
  end


  form do |f|
    f.semantic_errors *f.object.errors.keys
    tabs do
      tab 'Данные' do
        f.inputs do
          f.input :active, as: :select, include_blank: false,
                  input_html: {class: 'custom-select'}
          f.input :number, input_html: {class: 'h-size--20'}
          f.input :object, input_html: {class: 'h-js--autosize h-js--autosize--min', rows: 3}
          f.input :issued_at, as: :date_picker
          f.input :closed_at, as: :date_picker
          f.input :customer, :as => :select, include_blank: true,
                  collection: Customer.active.collect { |model| [model.name, model.id] },
                  input_html: {class: 'custom-select size-40'}
          f.input :agent, :as => :select, include_blank: true,
                  collection: Agent.accreditation.collect { |model| [model.name, model.id] },
                  input_html: {class: 'custom-select size-40'}
        end
      end
      tab 'Этапы' do
        f.inputs do
          f.has_many :stages, heading: false, allow_destroy: true, new_record: 'Добавить' do |model|
            model.input :operate, as: :select, include_blank: false, collection: Stage::OPTIONS.to_a,
                        input_html: {class: 'custom-select'}
            model.input :operate_at, as: :date_picker
            model.input :operation
            model.input :passed_at, as: :date_picker
          end
        end
      end unless f.object.new_record?
    end
    f.actions
  end


  sidebar 'Состояние', only: :show do
    attributes_table_for resource do
      row :active
      row(:status) { |model| model.status_value }
    end
  end

  sidebar 'Статистика', only: [:show, :edit] do
    attributes_table do
      row :updated_at
      row :created_at
    end
  end


  action_item :inspection_attestats, only: :index do
    link_to 'Инспекция Аттестатов', inspection_admin_attestats_path, method: :patch
  end

  collection_action :inspection, method: :patch do
    done = Attestat.inspection
    redirect_back fallback_location: admin_dashboard_path, notice: "[#{done}] Инспекция аттестатов проведена!"
  end
end
