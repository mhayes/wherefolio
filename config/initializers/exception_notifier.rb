if Rails.env.production?
  Wherefolio::Application.config.middleware.use ExceptionNotifier,
    email_prefix: "[WHEREFOLIO] ",
    sender_address: %{"exceptions" <no-reply@wherefolio.com>},
    exception_recipients: 'mark@deployfx.com'
end