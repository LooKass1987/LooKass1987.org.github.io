ActiveAdmin.register_page 'Dashboard' do

  menu priority: 1, label: proc{ I18n.t 'active_admin.dashboard' }

  content title: proc{ I18n.t 'active_admin.dashboard' } do
    columns do
      column do
        render partial: 'certificate'
      end

      column do
        render partial: 'attestat'
      end
    end

    panel 'Последние новости' do
      ul class: 'm-t-1' do
        Article.recent(5).map do |model|
          li link_to(model.header, admin_article_path(model))
        end
      end
    end

    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end
  end


  sidebar 'Аккаунт' do
    h3 class: 'm-t-1' do
      link_to(current_user, admin_user_path(current_user))
    end
    attributes_table_for current_user do
      row :is_admin
      row :sign_in_count
      row :current_sign_in_at do
        time_ago_in_words current_user.current_sign_in_at
      end
      row :current_sign_in_ip
    end
    attributes_table_for current_user do
      row :customers do |model|
        link_to model.customers.count, admin_customers_path('q[user_id_eq]' => model)
      end
      row :agents do |model|
        link_to model.agents.count, admin_agents_path('q[user_id_eq]' => model)
      end
    end
  end


  action_item :inspection_certificates do
    link_to 'Инспекция Сертификатов', inspection_admin_certificates_path, method: :patch
  end

  action_item :inspection_attestats do
    link_to 'Инспекция Аттестатов', inspection_admin_attestats_path, method: :patch
  end

  action_item :feedback do
    link_to 'Рассылка', admin_dashboard_feedback_path, method: :patch
  end


  page_action :feedback, method: :patch do
    done = Certificate.feedback + Attestat.feedback
    redirect_back fallback_location: admin_dashboard_path, notice: "[#{done}] Рассылка проведена!"
  end
end
