<?php

namespace Models;

use App\Database;
use App\Helper;

/**
 * Class Auth
 * @package Models
 */
class Auth
{

    public static function login($request)
    {
        $email=$request->email;
        Database::query("SELECT * FROM accounts WHERE email = :email");
        Database::bind(':email', $email);

        if (!is_null(Database::fetch()) && password_verify($request->password, Database::fetch()['password'])) {
            $_SESSION['made_bio']['id'] = base64_encode(Database::fetch()['id']);
            $_SESSION['made_bio']['is_admin'] = Database::fetch()['is_admin'];
            return true;
        }
        return false;
    }

    public static function logout()
    {
        session_destroy();
        unset($_SESSION['made_bio']);
        return true;
    }
}
