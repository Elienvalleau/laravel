<?php

namespace App\Http\Controllers\Front;

use App\User;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

class StatsController extends Controller
{
    public function index()
    {
        $avg = DB::table('notes')
            ->avg('note');


        $best_laravel = DB::table('notes')
            ->join('users', 'user_id', '=', 'users.id')
            ->where('epreuve', 'LIKE', 'laravel')
            ->orderBy('note', 'desc')
            ->first();

        $best_linux = DB::table('notes')
            ->join('users', 'user_id', '=', 'users.id')
            ->where('epreuve', 'LIKE', 'linux')
            ->orderBy('note', 'desc')
            ->first();

        $best_html = DB::table('notes')
            ->join('users', 'user_id', '=', 'users.id')
            ->where('epreuve', 'LIKE', 'html')
            ->orderBy('note', 'desc')
            ->first();

        $best_css = DB::table('notes')
            ->join('users', 'user_id', '=', 'users.id')
            ->where('epreuve', 'LIKE', 'css')
            ->orderBy('note', 'desc')
            ->first();

        $best_android = DB::table('notes')
            ->join('users', 'user_id', '=', 'users.id')
            ->where('epreuve', 'LIKE', 'android')
            ->orderBy('note', 'desc')
            ->first();

        $best_management = DB::table('notes')
            ->join('users', 'user_id', '=', 'users.id')
            ->where('epreuve', 'LIKE', 'management')
            ->orderBy('note', 'desc')
            ->first();


        $worst_laravel = DB::table('notes')
            ->join('users', 'user_id', '=', 'users.id')
            ->where('epreuve', 'LIKE', 'laravel')
            ->orderBy('note', 'asc')
            ->first();

        $worst_linux = DB::table('notes')
            ->join('users', 'user_id', '=', 'users.id')
            ->where('epreuve', 'LIKE', 'linux')
            ->orderBy('note', 'asc')
            ->first();

        $worst_html = DB::table('notes')
            ->join('users', 'user_id', '=', 'users.id')
            ->where('epreuve', 'LIKE', 'html')
            ->orderBy('note', 'asc')
            ->first();

        $worst_css = DB::table('notes')
            ->join('users', 'user_id', '=', 'users.id')
            ->where('epreuve', 'LIKE', 'css')
            ->orderBy('note', 'asc')
            ->first();

        $worst_android = DB::table('notes')
            ->join('users', 'user_id', '=', 'users.id')
            ->where('epreuve', 'LIKE', 'android')
            ->orderBy('note', 'asc')
            ->first();

        $worst_management = DB::table('notes')
            ->join('users', 'user_id', '=', 'users.id')
            ->where('epreuve', 'LIKE', 'management')
            ->orderBy('note', 'asc')
            ->first();



        //graph

        $avg_laravel = DB::table('notes')
            ->where('epreuve', 'LIKE', 'laravel')
            ->avg('note');

        $avg_linux = DB::table('notes')
            ->where('epreuve', 'LIKE', 'linux')
            ->avg('note');

        $avg_html = DB::table('notes')
            ->where('epreuve', 'LIKE', 'html')
            ->avg('note');

        $avg_css = DB::table('notes')
            ->where('epreuve', 'LIKE', 'css')
            ->avg('note');

        $avg_android = DB::table('notes')
            ->where('epreuve', 'LIKE', 'android')
            ->avg('note');

        $avg_management = DB::table('notes')
            ->where('epreuve', 'LIKE', 'management')
            ->avg('note');


        $data = \Lava::DataTable();
        $data->addColumn('string')
            ->addNumberColumn('Moyennes')
            ->addRow(['Android', $avg_android])
            ->addRow(['Management', $avg_management])
            ->addRow(['HTML', $avg_html])
            ->addRow(['Laravel', $avg_laravel])
            ->addRow(['Linux', $avg_linux])
            ->addRow(['CSS', $avg_css]);


        \Lava::LineChart('Notes', $data, [
            'title' => 'Moyennes en fonction des épreuves'
        ]);


        return view("front/stats/index", compact('best_laravel', 'best_linux', 'best_html', 'best_css', '$best_android',
            'best_android', 'best_management', 'worst_laravel', 'worst_linux',
            'worst_html', 'worst_css', 'worst_android', 'worst_management',
            'best', 'worst', 'avg'));
    }


}
