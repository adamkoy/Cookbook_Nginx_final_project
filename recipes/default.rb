#
# Cookbook:: nginx
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

#update ubuntu resources
apt_update 'update_sources' do
  action :update
end

package "nginx" do
  action :install
end

service "nginx" do
  action [:enable, :start]
end

# execute "start nginx" do
#   command "systemctl start nginx"
# end

template '/etc/nginx/sites-available/proxy.conf' do
  source 'proxy.conf.erb'
  variables proxy_port: node['nginx']['proxy_port']

end

# A proxy.conf is in sites available. create a symbolic link so that site enable
link '/etc/nginx/sites-enabled/proxy.conf' do
  to '/etc/nginx/sites-available/proxy.conf'
end

link '/etc/nginx/sites-enabled/default' do
  action :delete
  notifies :restart, "service[nginx]"
end
