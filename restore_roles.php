<?php
// Restoring default WordPress roles
function restore_wordpress_roles() {
    // Remove all existing roles to reset
    global $wp_roles;
    if (!isset($wp_roles)) {
        $wp_roles = new WP_Roles();
    }
    $wp_roles->roles = [];
    $wp_roles->role_objects = [];
    $wp_roles->role_names = [];
    $wp_roles->use_db = true;

    // Reinitialize default roles
    require_once(ABSPATH . 'wp-admin/includes/schema.php');
    populate_roles();
}

// Assign roles to users
function assign_user_roles() {
    $user_roles = [
        6 => 'administrator',
        5 => 'editor',
        3 => 'administrator',
        4 => 'editor',
        1 => 'administrator',
    ];

    foreach ($user_roles as $user_id => $role) {
        $user = get_user_by('ID', $user_id);
        if ($user) {
            // Remove all existing roles
            $user->set_role('');
            // Assign new role
            $user->set_role($role);
            echo "Updated user ID {$user_id} with role {$role}\n";
        } else {
            echo "User ID {$user_id} not found\n";
        }
    }
}

// Execute the functions
restore_wordpress_roles();
assign_user_roles();
?>
