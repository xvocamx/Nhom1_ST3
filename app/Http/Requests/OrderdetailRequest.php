<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class OrderdetailRequest extends FormRequest
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
          'quantityedit' => 'required|numeric',
          'priceedit' => 'required|numeric',
        ];
    }
    public function messages(){
      return [
          'quantityedit.required'=>'Vui lòng nhập Price Product',
          'quantityedit.numeric'=>'Vui lòng nhập số',
          'priceedit.required'=>'Vui lòng nhập Price Sale Product',
          'priceedit.numeric'=>'Vui lòng nhập số',
      ];
    }
}
