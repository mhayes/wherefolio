set :rails_env, 'production'
server = "wherefolio.com"

role :app, server
role :web, server
role :db, server, :primary => true
