# vagrant-lamp

A basic [Vagrant](https://www.vagrantup.com/) LAMP development server provisioned with puppet. The base is from my vagrant-debian-wheezy box.

## Usage

1. Download and install [Vagrant](https://www.vagrantup.com/) and [VirtualBox](https://www.virtualbox.org/)
1. Navigate to the vagrant-lamp directory and execute the command `vagrant up` to create the environment
1. Provisioning the system initially may take a long time, wait an hour or so (depends on your network speed)
1. Once complete, content in the www directory will be served by the VM at [localhost:8080](http://localhost:8080)
1. This www directory is synced with the VM, any changes will be reflected immediately
1. Execute the command `vagrant ssh` to open an SSH shell to the VM
1. Any mail sent will be redirected to the vagrant user, view it with the `mail` command when connected
1. Disconnect, and execute the command `vagrant halt` to shut down the VM

## Author

[Arthur Dick](http://arthurdick.com)

## License

[MIT License](http://www.opensource.org/licenses/mit-license.php)

Copyright (c) 2014, Arthur Dick

