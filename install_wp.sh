#!/bin/bash

# Yêu cầu người dùng nhập các thông tin cần thiết
read -p "Nhập tên cơ sở dữ liệu: " dbname
read -p "Nhập tên người dùng cơ sở dữ liệu: " dbuser
read -sp "Nhập mật khẩu của cơ sở dữ liệu: " dbpass
echo ""
read -p "Nhập tên miền: " domain

# Tạo mật khẩu ngẫu nhiên cho tài khoản admin
admin_password=$(openssl rand -base64 12)

# Tải và cài đặt WordPress
wp core download --allow-root
wp core config --dbname="$dbname" --dbuser="$dbuser" --dbpass="$dbpass" --allow-root
wp core install --url="http://$domain" --title="$domain" --admin_user="admin" --admin_password="$admin_password" --admin_email="admin@$domain" --allow-root

# Hiển thị thông tin đăng nhập admin
echo "WordPress đã được cài đặt thành công."
echo "Thông tin đăng nhập admin:"
echo "Tên đăng nhập: admin"
echo "Mật khẩu: $admin_password"
echo "Email: admin@$domain"
