<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UserRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'txtEmail'=>'min:6|max:255|unique:users,email',
            'txtPass'=>'required|min:6|max:255',
            'txtRePass'=>'required|min:6|max:255|same:txtPass',
            'txtPhone'=>'required|numeric',
            'txtAddress'=>'required',
        ];
    }
}
