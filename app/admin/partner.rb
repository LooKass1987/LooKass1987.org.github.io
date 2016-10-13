ActiveAdmin.register Partner do
  permit_params :index, :published,
                :name, :content, :phone, :email, :address, :logotype

  scope :all, default: true
  scope :published
  scope :draft

  menu priority: 7, label: proc { I18n.t('active_admin.partners') }


  index do
    selectable_column
    id_column
    column :published, class: 'h-size--boolean'
    column :index, class: 'h-size--integer'
    column :logotype, class: 'h-size--image', sortable: false do |model|
      link_to edit_admin_partner_path(model) do
        imagic_tag model.logotype.thumb,
                   class: 'img-thumbnail d-block m-x-auto',
                   width: 96,
                   height: 96
      end
    end
    column :name, class: 'h-size--10'
    column :content do |model|
      model.content.html_safe unless model.content.blank?
    end
    column :address, class: 'h-size--10'
    column :website, class: 'h-size--10' do |model|
      model.website.nil? ? '--' : link_to(model.website, model.website, target: '_blank')
    end
    column :created_at
    actions
  end

  index as: :grid, columns: 5 do |model|
    link_to admin_partner_path(model) do
      imagic_tag model.logotype,
                 class: 'img-thumbnail d-block m-x-auto',
                 width: 192,
                 height: 192
    end
  end

  filter :name
  filter :content
  filter :address
  filter :created_at

  batch_action :published, priority: 1 do |ids|
    batch_action_collection.find(ids).each do |model|
      model.update published: true unless model.published
    end
    redirect_to collection_path, alert: t('active_admin.batch_actions.alerts.published')
  end

  batch_action :unpublished, priority: 2 do |ids|
    batch_action_collection.find(ids).each do |model|
      model.update published: false if model.published
    end
    redirect_to collection_path, alert: t('active_admin.batch_actions.alerts.unpublished')
  end


  show do
    attributes_table do
      row :name
      row :content do |model|
        div class: 'c-text--readable' do
          model.content.html_safe
        end unless model.content.blank?
      end
    end
    panel 'Контакты' do
      attributes_table_for resource do
        row :email
        row :phone
        row :address
        row :website
      end
    end
    active_admin_comments
  end


  form do |f|
    f.semantic_errors *f.object.errors.keys
    tabs do
      tab 'Данные' do
        f.inputs do
          f.input :published, as: :select, include_blank: false,
                  input_html: {class: 'custom-select'}
          f.input :index, as: :number,
                  input_html: {class: 'h-size--10',
                               min: 0}
        end
        f.inputs do
          f.input :logotype, as: :file,
                  input_html: {accept: f.object.logotype.input_accept}
        end
        f.inputs do
          f.input :name,
                  input_html: {class: 'h-size--50'}
          f.input :content,
                  input_html: {class: 'h-js--redactor',
                               rows: 3}
        end
      end
      tab 'Контакты' do
        f.inputs do
          f.input :phone, as: :phone,
                  input_html: {class: 'h-size--40'}
          f.input :email, as: :email,
                  input_html: {class: 'h-size--40'}
          f.input :address
          f.input :website,
                  input_html: {class: 'h-size--30'}
        end
      end
    end
    f.actions
  end


  sidebar 'Публикация', only: :show do
    attributes_table_for resource do
      row :published
      row :index
    end
  end

  sidebar 'Логотип', only: [:show, :edit] do
    imagic_tag resource.logotype,
               class: 'img-thumbnail d-block m-x-auto'
  end

  sidebar 'Статистика', only: [:show, :edit] do
    attributes_table do
      row :updated_at
      row :created_at
    end
  end
end
