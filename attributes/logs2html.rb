# install the newest version if nil
default['znc']['logs2html']['version'] = nil

# regenerate the logs every interval minutes
default['znc']['logs2html']['interval'] = 5
default['znc']['logs2html']['output_dir'] = "/var/lib/logs2html"
