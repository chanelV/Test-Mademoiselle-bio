<?php

namespace Models;

use App\Database;
use App\Helper;

class Programs
{
    public static function findAll()
    {
        Database::query("SELECT * FROM programs ORDER BY name ASC");
        return Database::fetchAll();
    }

    public static function findOne($id)
    {
        Database::query("SELECT * FROM programs WHERE id = :id");
        Database::bind(':id', intval($id));

        return Database::fetch();
    }

    public static function create($request)
    {
        $name = trim(htmlspecialchars($request->name));
        $code = strtoupper(Helper::uniqidReal(8));
       
        Database::query("SELECT * FROM programs WHERE name = :name"); 
        Database::bind(':name', $name);
        if (!is_null(Database::fetch())) {
            return "existed";
        }

        $data = [
            "name" => $name,
            "code" => $code
        ];

        Database::query("INSERT INTO programs(`name`, `code`) VALUES(:name, :code");
        Database::bind([
            ':name' => $data['name'],
            ':code' => $data['code']
        ]);

        if (Database::execute()) return "created";
        return "failed";
    }

    public static function update($request)
    {
        $name = trim(htmlspecialchars($request->name));
        Database::query("SELECT * FROM programs WHERE name = :name AND id != :id");
        Database::bind([':name' => $name, ':id'=> intval($request->id)]);
        if (!is_null(Database::fetch())) {
            return "existed";
        }

        $data = ["name" => $name];
        Database::query("UPDATE programs SET name = :name WHERE id = :id");
        Database::bind([
            ':name' => $data['name'],
            ':id' => intval($request->id)
        ]);

        if (Database::execute()) {
            return "updated";
        }
        return "failed";
    }

    public static function delete($id){
        Database::query("DELETE FROM programs WHERE id = :id");
        Database::bind(':id', intval($id));

        if (Database::execute()){
            return "deleted";
        }
        return "failed";
    }
}
