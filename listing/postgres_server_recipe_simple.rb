include_recipe "postgresql::client"

package "postgresql-#{node[:postgresql][:version]}"

template "#{node[:postgresql][:dir]}/postgresql.conf" do
  source "postgresql.conf.erb"
  owner "postgres"
  group "postgres"
  mode "0600"
end

service "postgresql-#{node[:postgresql][:version]}" do
  action :start
end
