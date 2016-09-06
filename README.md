# puppet-modules

Here I collect Puppet modules that could be interesting, useful, or I think they are good for me or us.

## Modules

### apt-securemount

Probably it is good practice to create seaprated partition for /tmp /var /usr and /boot (also /home /var/log and /opt too). And set these mount parameters:

* noexec /tmp
* noexec /var
* ro /usr
* ro /boot

During apt installation you should have more permission for /temp /var /usr and /boot. This modules enables this during apt installation and switch things back after installation.

### favoritetools

A few must have tools for systam administrtion.

### jdk7

Java Developer Kit 7 installation module based on webupd8 installer for DEB package based systems.

