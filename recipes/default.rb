#
# Cookbook Name:: teletraan-agent
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

directory '/opt/teletraan' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

directory '/var/log/teletraan' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end



remote_file '/opt/teletraan/agent.zip' do
  mode '0644'
  source 'https://github.com/pinterest/teletraan/releases/download/'+node[:teletraan][:release_version]+'/deploy-agent-'+node[:teletraan][:agent_version]+'.zip'
  notifies :run, 'execute[install]', :immediately
end

execute 'install' do
  command 'pip install /opt/teletraan/agent.zip'
  action :nothing
end


template 'agent_conf' do
  path '/opt/teletraan/agent.conf'
  source 'agent.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables({
   :teletraan => node['teletraan']
     })
end

my_env_vars = {"SHELL" => "/bin/sh", "PATH" => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin"}    


cron 'teletraan' do
  minute '*'
  environment my_env_vars
  command '/usr/local/bin/deploy-agent -f /opt/teletraan/agent.conf -n ' + node['hostname']
end

