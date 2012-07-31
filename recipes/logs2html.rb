include_recipe "python"
include_recipe "cron"

include_recipe "znc::default"

python_pip "irclog2html" do
  version node['znc']['logs2html']['version']
  action :install
end


directory node['znc']['logs2html']['output_dir'] do
  owner node['znc']['user']
  group node['znc']['group']
  mode "0755"
  recursive true
end

users = search(:znc_users, '*:*')

logged = {}
users.each do |u|
  directory node['znc']['logs2html']['output_dir'] + "/#{u['id']}" do
    owner node['znc']['user']
    group node['znc']['group']
    mode "0755"
  end

  channels = u['channels'].inject([]) do |logged_channels, (k, v)|
    logged_channels << k if v.is_a?(Hash) && v['logs2html']
    logged_channels
  end
  logged[u['id']] = channels

  channels.each do |channel|
    directory node['znc']['logs2html']['output_dir'] + "/#{u['id']}" + "/#{channel}" do
      owner node['znc']['user']
      group node['znc']['group']
      mode "0755"
    end
  end
end

template node['znc']['data_dir'] + "/logs2html.sh" do
  owner node['znc']['user']
  group node['znc']['group']
  mode "0750"
  variables :logged => logged
end

cron "logs2html" do
  minute "*/#{node['znc']['logs2html']['interval']}"

  command node['znc']['data_dir'] + "/logs2html.sh"
  user node['znc']['user']
end
