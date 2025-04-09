# For WS admin only

## SMB mount
``mount_smb_storage.sh`` : Script to mount samba remote server. To be installed.

List of aliases to be added to ``/etc/bash.bashrc``

```
alias mnt_stor01_edpr="mount_smb_storage.sh -s iiticubstor01.iit.local -f edpr"
alias mnt_ns010_scratch="mount_smb_storage.sh -s iiticubns010.iit.local -f scratch"
alias mnt_ns010_internal_datasets="mount_smb_storage.sh -s iiticubns010.iit.local -f internal_datasets"
alias mnt_ns010_projects="mount_smb_storage.sh -s iiticubns010.iit.local -f projects"
alias mnt_ns010_users="mount_smb_storage.sh -s iiticubns010.iit.local -f users"
alias mnt_ns008_workspace="mount_smb_storage.sh -s iiticubns008.iit.local -f workspace"
```
# Virtualenvwrapper

After installing it with ``sudo apt install python3-virtualenvwrapper`` enable it for all users by adding ``source /usr/share/virtualenvwrapper/virtualenvwrapper.sh`` at the beginning of ``/etc/bash.bashrc``

# Docker
After installing it following [this guide](https://docs.docker.com/engine/install/ubuntu/) we can enable 
non root access ti all member of group.

``` 
sudo apt install members
for m in `members eventdrivenperceptionforrobotics_users`; do sudo usermod -aG docker $m; done
```

# MOTD

Make 99-edpr executable and add line to bash.bashrc to run it