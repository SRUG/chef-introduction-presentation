include_recipe "postgresql::client"

package "postgresql-#{node[:postgresql][:version]}"

service "postgresql" do
  service_name "postgresql-#{node[:postgresql][:version]}"
  supports :restart => true, :status => true
  action :nothing
end

template "#{node[:postgresql][:dir]}/postgresql.conf" do
  source "postgresql.conf.erb"
  owner "postgres"
  group "postgres"
  mode "0600"
  notifies :restart, "service[postgresql]"
end
