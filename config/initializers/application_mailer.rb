# Action Mailer Configuration for Yandex
Rails.application.config.action_mailer.smtp_settings = {
    address: 'smtp.yandex.ru',
    port: 465,
    user_name: 'default@ncsc.msk.ru',
    password: '+1234567',
    authentication: 'plain',
    tls: true,
}
