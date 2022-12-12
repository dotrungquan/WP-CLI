#!/bin/bash
#Auth: DOTRUNGQUAN.INFO
read -p "Nhao vao UserName cPanel: " user
read -p "Nhap vao ten mien cu: " olddomain
read -p "Nhap vao ten mien moi: " newdomain
read -p "Nhap vao Document Root: " document_root

cd /home/$user/"$document_root"/$olddomain
/usr/local/bin/wp db export --allow-root

/usr/local/bin/wp search-replace '$olddomain' '$newdomain' --allow-root
