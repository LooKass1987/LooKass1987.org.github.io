ActiveAdmin.register Agent do
  permit_params :active, :user_id,
                :name, :email, :phone, :address,
                role: []

  scope :all, default: true
  scope :active
  scope :passive

  menu priority: 6, label: proc { I18n.t('active_admin.agents') }


  index do
    selectable_column
    id_column
    column :active, class: 'h-size--boolean'
    column :role, class: 'h-size--10' do |model|
      Agent::ROLES.key model.role
    end
    column :name
    column :user, class: 'h-size--20'
    column :created_at
    actions
  end

  index as: :table_alter do
    selectable_column
    id_column
    column :active, class: 'h-size--boolean'
    column :role, class: 'h-size--10' do |model|
      Agent::ROLES.key model.role
    end
    column :name
    column :email, class: 'h-size--20'
    column :phone, class: 'h-size--10'
    column :address, class: 'h-size--10'
    actions
  end

  filter :name
  filter :role, as: :select, collection: Agent::ROLES.to_a,
         input_html: {class: 'custom-select'}
  filter :user, as: :select, collection: proc { User.all.collect { |u| [u.to_s, u.id] } },
         input_html: {class: 'custom-select'}
  filter :updated_at
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
    panel 'Состояние' do
      attributes_table_for resource do
        row :active
        row(:role) { Agent::ROLES.key resource.role }
        row(:user) { link_to resource.user, admin_user_path(resource.user.id) if resource.user }
      end
    end
    attributes_table do
      row :name
      row :email
      row :phone
      row :address
    end
    active_admin_comments
  end


  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :active, as: :select, include_blank: false,
              input_html: {class: 'custom-select'}
      f.input :role, as: :radio,
              collection: Agent::ROLES.to_a
      f.input :user, as: :select, include_blank: true,
              collection: User.all.collect { |u| [u.to_s, u.id] },
              input_html: {class: 'custom-select h-size--30'}
    end
    f.inputs do
      f.input :name,
              input_html: {class: 'h-size--50'}
      f.input :email,
              input_html: {class: 'h-size--40'}
      f.input :phone,
              input_html: {class: 'h-size--40'}
      f.input :address
    end
    f.actions
  end


  sidebar 'Связи', only: [:show, :edit] do
    attributes_table do
      row :certificates do |model|
        link_to model.certificates.count, admin_certificates_path('q[agent_id_eq]' => model)
      end
      row :attestats do |model|
        link_to model.attestats.count, admin_attestats_path('q[agent_id_eq]' => model)
      end
    end
  end

  sidebar 'Статистика', only: [:show, :edit] do
    attributes_table do
      row :updated_at
      row :created_at
    end
  end
end
