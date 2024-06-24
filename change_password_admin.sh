#!/bin/bash

# Lệnh để liệt kê các user có quyền administrator
ADMIN_USERS=$(wp user list --role=administrator --field=user_login --allow-root)

# Hàm để tạo mật khẩu ngẫu nhiên 16 ký tự
generate_password() {
    echo $(< /dev/urandom tr -dc 'A-Za-z0-9!@#$%^&*()_+-=' | head -c16)
}

# Thay đổi mật khẩu cho các user administrator và in ra
for USER in $ADMIN_USERS; do
    NEW_PASS=$(generate_password)
    wp user update $USER --user_pass=$NEW_PASS --allow-root
    echo "User: $USER, New Password: $NEW_PASS"
done
