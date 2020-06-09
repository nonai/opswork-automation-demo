include apache2

apache2_install 'default_install'

apache2_site '000-default' do
  action :disable
end

apache2_default_site '' do
  action :enable
end

service 'apache2' do
  extend Apache2::Cookbook::Helpers
  service_name lazy { apache_platform_service_name }
  supports restart: true, status: true, reload: true
  action :nothing
end

app_dir = '/var/www/pricesp/pricespectre.com'

directory app_dir do
  recursive true
end