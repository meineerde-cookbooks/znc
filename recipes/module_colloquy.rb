#
# Cookbook Name:: znc
# Recipe:: module_colloquy
#
# Copyright 2011, Seth Chisamore
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "znc"

# znc > 0.0.9 required...this means compiling from source on most platforms
remote_file "#{node['znc']['data_dir']}/modules/colloquy.cpp" do
  source "https://github.com/wired/colloquypush/raw/master/znc/colloquy.cpp"
  mode "0644"
  not_if {::File.exists?("#{node['znc']['data_dir']}/modules/colloquy.so")}
end

bash "znc-buildmod colloquy.cpp" do
  cwd "#{node['znc']['data_dir']}/modules"
  creates "#{node['znc']['data_dir']}/modules/colloquy.so"
  notifies :reload, "service[znc]", :immediately
end

