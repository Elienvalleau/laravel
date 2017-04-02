<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Note extends Model
{
    protected $table = "notes";
    protected $fillable = array("id", "user_id", "note", "coeff", "epreuve");
    public static $rules = array(
        "create" => array (
            'user_id' => 'required|integer',
            "note" => 'required|integer',
            "coeff" => 'required|integer',
            'epreuve' => 'required|string|min:2',
        ),
        "update" => array (
            'user_id' => 'integer',
            "note" => 'required|integer',
            "coeff" => 'required|integer',
            'epreuve' => 'required|string|min:2',
        )
    );

    public function user()
    {
        return $this->belongsTo("App\User", "user_id", "id");
    }
}
