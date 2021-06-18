<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ProductRequest extends FormRequest
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
            'txtName' => 'required|min:3|max:255|unique:products,name',
            'txtPrice' => 'required|numeric',
            'txtPriceSale' => 'required|numeric',
            'txtQuantity' => 'required|numeric',
            'txtColor' => 'required',
            'fImages' => 'image',
            'detail' => 'required',
            'rdoStatus' => 'required',
        ];
    }
    public function messages()
    {
        return [
            'txtName.required' => 'Vui lòng nhập Name Product',
            'txtName.min'=>'Vui lòng nhập nhiều hơn 3 ký tự',
            'txtName.max'=>'Vui lòng nhập ít hơn 255 ký tự',
            'txtName.unique'=>'Name Product đã tồn tại vui lòng chọn Name Product khác',
            'txtPrice.required'=>'Vui lòng nhập Price Product',
            'txtPrice.numeric'=>'Vui lòng nhập số',
            'txtPriceSale.required'=>'Vui lòng nhập Price Sale Product',
            'txtPriceSale.numeric'=>'Vui lòng nhập số',
            'txtQuantity.required'=>'Vui lòng nhập Quantity Product',
            'txtQuantity.numeric'=>'Vui lòng nhập số',
            'txtColor.required'=>'Vui lòng nhập Color Product',
            'fImages.image'=>'Vui lòng chọn định dạng Image',
            'detail.required' => 'Vui lòng nhập detail',
            'rdoStatus.required' => 'Vui lòng chọn hightlights',
        ];
    }
}
