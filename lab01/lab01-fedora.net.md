
You can display all the configured connections in Network Manager by running the
following command:
```
# nmcli con show
```
```console
NAME UUID TYPE DEVICE
eth0 394f6436-5524-4154-b26e-6649b4d29027 802-3-ethernet eth0
```
To show how nmcli can be used to set up a different connection profile, let’s create a new
connection for eth0:
```
# nmcli con add con-name "eth0-work" type ethernet ifname eth0
```
Then, a static IP address and default gateway can be configured, as shown here:
```
# nmcli con mod "eth0-work" ipv4.addresses "192.168.20.100/24 192.168.20.1"
```
You can run nmcli con show connection-id to display the current settings for a
connection. Additional properties can be modified from the Network Manager command-line
tool. For example, to add a DNS server to the eth-work connection, run
```
# nmcli con mod "eth0-work" +ipv4.dns 192.168.20.1
```
Finally, to switch to the new connection profile, run
```
# nmcli con up "eth0-work"
```
A connection can be prevented from starting automatically at boot with the following
command:
```
# nmcli con mod "eth0-work" connection.autoconnect no
```
