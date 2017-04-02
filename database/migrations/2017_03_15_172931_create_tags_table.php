<?php

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTagsTable extends Migration
{
    public function up()
    {
        Schema::create('tags', function (Blueprint $table) {
            $table->engine="InnoDB";
            $table->increments('id');
            $table->string("nom");
            $table->timestamps();
        });

        Schema::create('comment_tag', function (Blueprint $table) {
            $table->engine="InnoDB";
            $table->increments('id');
            $table->integer("comment_id")->unsigned();
            $table->integer("tag_id")->unsigned();
            $table->foreign("comment_id")->references("id")->on("commentaires")->onDelete("cascade")->onUpdate("cascade");
            $table->foreign("tag_id")->references("id")->on("tags")->onDelete("cascade")->onUpdate("cascade");
        });


    }

    public function down()
    {
        DB::statement("SET FOREIGN_KEY_CHECKS=0");
        Schema::dropIfExists('tags');
        Schema::dropIfExists('comment_tag');
    }
}
