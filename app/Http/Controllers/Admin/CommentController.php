<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Comment;

class CommentController extends Controller
{
  public function getList(){
    $comment = Comment::all();
    return view('admin.Comment.list',['comment'=>$comment]);
  }
}
