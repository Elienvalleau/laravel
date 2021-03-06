<?php

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCommentairesTable extends Migration
{

    public function up()
    {
        Schema::create('commentaires', function (Blueprint $table) {
            $table->engine = "InnoDB";
            $table->increments('id');
            $table->text("content");
            $table->integer("user_id")->unsigned();
            $table->boolean("active");
            $table->string("auteur");
            $table->foreign("user_id")->references("id")->on("users")->onDelete("cascade")->onUpdate("cascade");
            $table->integer('parent_id')->unsigned()->default(0);
            $table->timestamps();
        });
    }


    public function down()
    {
        DB::statement("SET FOREIGN_KEY_CHECKS=0");
        Schema::dropIfExists('commentaires');
    }
}
