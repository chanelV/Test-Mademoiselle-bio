<?php

namespace Models;

use App\Database;
use App\Helper;

class Roles
{
    public static function findAll()
    {
        Database::query("SELECT * FROM roles ORDER BY label ASC");
        return Database::fetchAll();
    }

    public static function findOne($id)
    {
        Database::query("SELECT * FROM roles WHERE id = :id");
        Database::bind(':id', intval($id));

        return Database::fetch();
    }

    public static function create($request)
    {
        $label = trim(htmlspecialchars($request->label));
       
        Database::query("SELECT * FROM roles WHERE label = :label"); 
        Database::bind(':label', $label);
        if (!is_null(Database::fetch())) {
            return "existed";
        }

        $data = ["label" => $label];

        Database::query("INSERT INTO roles(`label`) VALUES(:label");
        Database::bind([
            ':label' => $data['label']
        ]);

        if (Database::execute()) return "created";
        return "failed";
    }

    public static function update($request)
    {
        $label = trim(htmlspecialchars($request->label));
        Database::query("SELECT * FROM roles WHERE label = :label AND id != :id");
        Database::bind([':label' => $label, ':id'=> intval($request->id)]);
        if (!is_null(Database::fetch())) {
            return "existed";
        }

        $data = ["label" => $label];
        Database::query("UPDATE users SET label = :label WHERE id = :id");
        Database::bind([
            ':label' => $data['label'],
            ':id' => intval($request->id)
        ]);

        if (Database::execute()) {
            return "updated";
        }
        return "failed";
    }

    public static function delete($id){
        Database::query("DELETE FROM roles WHERE id = :id");
        Database::bind(':id', intval($id));

        if (Database::execute()){
            return "deleted";
        }
        return "failed";
    }
}
