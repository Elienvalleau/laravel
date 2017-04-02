<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Commentaire extends Model
{
    protected $table = "commentaires";
    protected $fillable = array("id", "auteur", "content", "created_at", "update_at", "user_id", "active", "parent_id");
    public static $rules = array(
        "create" => array (
            "user_id" => 'required|integer',
            "content" => 'required|string',
            "active" => 'boolean',
            "auteur" => 'required|string',
            "parent_id" => 'integer',
        ),
        "update" => array (
            "user_id" => 'integer',
            "content" => 'required|string',
            "active" => 'boolean',
            "auteur" => 'string',
            "parent_id" => 'integer',
        ),
        "valide" => array (
            "active" => 'boolean',
        )
    );

    public function user()
    {
        return $this->belongsTo("App\User", "user_id", "id");
    }

    public function replies()
    {
        return $this->hasMany('content', 'parent_id');
    }

    public function tags()
    {
        return $this->belongsToMany('App\Tag', "comment_tag", "comment_id", "tag_id");
    }

    public function saveTags($tags)
    {
        $tags = array_filter(array_unique(array_map(function ($item){
                return trim($item);
            },explode(',', $tags))), function($item) {
            return !empty($item);
        });

        $persisted_tags = Tag::whereIn('nom', $tags)->get();

        $tags_to_create = array_diff($tags, $persisted_tags->pluck('nom')->all());
        $tags_to_create = array_map(function ($tags) {
            return ['nom' => $tags];
        }, $tags_to_create);
        $created_tags = $this->tags()->createMany($tags_to_create);
        $persisted_tags = $persisted_tags->merge($created_tags);
        $this->tags()->sync($persisted_tags);
    }
}
