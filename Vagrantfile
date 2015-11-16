# -*- mode: ruby -*-
# vi: set ft=ruby :

$script = <<SCRIPT
cd /home/vagrant
wget http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb
sudo apt-get update
sudo apt-get install -y git elixir erlang-ssl erlang-inets inotify-tools
sudo apt-get install -y npm nodejs-legacy
sudo apt-get install -y postgresql
mix archive.install https://github.com/phoenixframework/phoenix/releases/download/v1.0.3/phoenix_new-1.0.3.ez
SCRIPT

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "vagrant-phoenix"
  config.vm.network "private_network", ip: "192.168.50.100"
  config.vm.synced_folder "./", "/vagrant", :mount_options => ['dmode=755', 'fmode=775']
  config.vm.provision "shell", inline: $script
end
