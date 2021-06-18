<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests\LoginRequest;
use Auth;

class LoginController extends Controller
{
  public function getLogin(){
    if(!Auth::check())
    {
      return view('admin.login');
    }else {
      return redirect()->route('user.getlist');
    }

  }
  public function postLogin(LoginRequest $request){
    if (Auth::attempt(['email' => $request->email, 'password' => $request->password,'level'=>1])) {
          // Authentication passed...
      return redirect()->intended('admin/dashboard');
    }else{
      return redirect()->back()->with(['color'=>'danger','thongbao'=>'Sai tài khoản hoặc mật khẩu']);
    }
  }

  public function getLogout(){
    Auth::logout();
    return redirect('admin/login');
  }
}
