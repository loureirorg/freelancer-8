require "omnicontacts"

Rails.application.middleware.use OmniContacts::Builder do
  importer :gmail, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'] #, {:redirect_path => "/oauth2callback", :ssl_ca_file => "/etc/ssl/certs/curl-ca-bundle.crt"}
  importer :yahoo, ENV['YAHOO_CLIENT_ID'], ENV['YAHOO_CLIENT_SECRET']#, {:callback_path => '/callback'}
  importer :linkedin, ENV['LINKEDIN_CLIENT_ID'], ENV['LINKEDIN_CLIENT_SECRET'], {:state => 'jhw873y48hdijweu3'} #, {:redirect_path => "/oauth2callback", :state => '<long_unique_string_value>'}
  importer :hotmail, ENV['HOTMAIL_CLIENT_ID'], ENV['HOTMAIL_CLIENT_SECRET']
  # importer :facebook, "client_id", "client_secret"
end