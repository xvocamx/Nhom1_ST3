<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use App\Http\Requests\UserRequest;
use DateTime;
use Hash,Auth;

class UserController extends Controller
{
    public function getList(){
      $users = User::orderBy('level','DESC')->get();
      return view('admin.Users.list',['users'=>$users]);
    }

    public function getAdd(){
      return view('admin.Users.add');
    }
    public function postAdd(UserRequest $request){
      $user = new User();
      $user->email = $request->txtEmail;
      $user->password = Hash::make($request->txtPass);
      $user->remember_token = $request->_token;
      $user->name = $request->txtUser;
      $user->gender = $request->gender;
      $user->level = $request->level;
      $user->phone= $request->txtPhone;
      $user->address= $request->txtAddress;
      $user->save();
      return redirect()->route('user.getlist')->with('thongbao','Thêm Thành Công');
    }
    public function getEdit($id){
      $user = User::find($id);
      return view('admin.Users.edit',['user'=>$user]);
    }
    public function postEdit($id,UserRequest $request){
      $user = User::find($id);
      $user->password = Hash::make($request->txtPass);
      $user->remember_token = $request->_token;
      $user->name = $request->txtUser;
      $user->gender = $request->gender;
      $user->level = $request->level;
      $user->phone= $request->txtPhone;
      $user->address= $request->txtAddress;
      $user->save();
      return redirect()->route('user.getlist')->with('thongbao','Sửa Thành Công');
    }
    public function getDelete($id){
      $user_current = Auth::user()->id;
      $user = User::find($id);
      if(($id == 1) || ($user_current != 1 && $user->level == 1) ){
        return redirect()->route('user.getlist')->with(['color'=>'danger','thongbao'=>'Không được phép xóa Admin này']);
      }else {
        $user->delete();
        return redirect()->route('user.getlist')->with(['color'=>'success','thongbao'=>'Xóa Thành Công']);
      }
    }
}
