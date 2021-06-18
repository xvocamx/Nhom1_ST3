<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class TrademarkRequest extends FormRequest
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
            'txtTrademarkName' => 'required|min:3|max:255'
        ];
    }
    public function messages()
    {
        return [
            'txtTrademarkName.required' => 'Vui lòng nhập vào Trademark name',
            'txtTrademarkName.min' => 'Vui lòng nhập ít nhất 3 ký tự',
            'txtTrademarkName.max' => 'Vui lòng nhập ít hơn 255 ký tự'
        ];
    }
}
