<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Tag extends Model
{
    protected $table = "tags";
    protected $fillable = array("id", "nom", "created_at", "update_at");
    public static $rules = array(
        "created" => array (
            "nom" => 'required|string',
        ),
        "update" => array (
            "nom" => 'required|string',
        )
    );

    public function commentaires()
    {
        return $this->belongsToMany("App\Commentaire", "comment_tag", "tag_id", "comment_id");
    }
}
