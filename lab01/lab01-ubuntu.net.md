## 1. View Current IP Address

To view the current IP address of your machine, you can use either of the following commands:
```
ip a
```

Running command will display the IP address information. Note down the name of the interface from the output of the above command.

## 2. Set Static IP Address

Ubuntu 20.04 uses netplan as a default network manager. The configuration file for the netplan is stored in the `/etc/netplan` directory. You can find this configuration file listed in the `/etc/netplan` directory the following command:
```
ls /etc/netplan
```
The above command will return the name of the configuration file with the .yaml extension

Before making any changes to this file, make sure to create a backup copy of it. Use the cp command to do so:
```
sudo cp /etc/netplan/01-network-manager-all.yaml 01-network-manager-all.yaml.bak
```
> Note: You might have a configuration file with the name other than the 01-network-manager-all.yaml. So make sure you use the right configuration file name in the commands.

Edit the netplan configuration using any text editor.
```
sudo nano /etc/netplan/01-network-manager-all.yaml
```
Then add the following lines by replacing the interface name, IP address, gateway, and DNS information that fit your networking needs.
```yaml
network:
version: 2
renderer: NetworkManager
ethernets:
 ens33:
  dhcp4: no
  addresses:
  - 192.168.72.140/24
  gateway4: 192.168.72.2
  nameservers:
   addresses: [8.8.8.8, 8.8.4.4]
```
Once done, save and close the file.

Now test the new configuration using the following command:
```
sudo netplan try
```
If it validates the configuration, you will receive the configuration accepted message; otherwise, it rolls back to the previous configuration.
Next, run the following command to apply the new configurations.
```
sudo netplan apply
```
After this, confirm the IP address of your machine using the following command:
```
ip a
```
It should reflect the changes you have made.



## 3. Set the Dynamic IP Address

In the following procedure, we will see how to configure the interface to receive a dynamic IP address from DHCP. Edit the netplan configuration file using any text editor. Here we are using the Nano text editor for this purpose.
```
sudo nano /etc/netplan/01-network-manager-all.yaml
```
Then add the following lines by replacing the interface name with your system’s network interface.
```yaml
network:
 version: 2
 renderer: NetworkManager
 ethernets:
  ens33:
   dhcp4: yes
   addresses: []
```
Once done, save and close the file.

Now test the new configuration using the following command:
```
sudo netplan try
```
If it validates the configuration, you will receive the configuration accepted message, otherwise, it rolls back to the previous configuration.

Next, run the following command to apply the new configurations.
```
sudo netplan apply
```

After this, check the IP address of your machine using the following command:
```
ip a
```