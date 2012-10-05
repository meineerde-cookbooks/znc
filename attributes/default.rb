#
# Cookbook Name:: znc
# Attribute:: default
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

default['znc']['install_method'] = 'package'
default['znc']['init_style']      = 'init'

default['znc']['user'] = 'znc'
default['znc']['group'] = 'znc'

default['znc']['data_dir']        = "/etc/znc"


default['znc']['anon_ip_limit']   = 10
default['znc']['connect_delay']   = 5
default['znc']['server_throttle'] = 30
default['znc']['status_prefix']   = "*"

default['znc']['port']            = "+7777"
default['znc']['skin']            = "dark-clouds"
default['znc']['max_buffer_size'] = 500
default['znc']['modules']         = %w{ webadmin adminlog }
