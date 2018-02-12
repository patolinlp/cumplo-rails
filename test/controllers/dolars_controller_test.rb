require 'test_helper'

class DolarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dolar = dolars(:one)
  end

  test "should get index" do
    get dolars_url
    assert_response :success
  end

  test "should get new" do
    get new_dolar_url
    assert_response :success
  end

  test "should create dolar" do
    assert_difference('Dolar.count') do
      post dolars_url, params: { dolar: { fecha: @dolar.fecha, valor: @dolar.valor } }
    end

    assert_redirected_to dolar_url(Dolar.last)
  end

  test "should show dolar" do
    get dolar_url(@dolar)
    assert_response :success
  end

  test "should get edit" do
    get edit_dolar_url(@dolar)
    assert_response :success
  end

  test "should update dolar" do
    patch dolar_url(@dolar), params: { dolar: { fecha: @dolar.fecha, valor: @dolar.valor } }
    assert_redirected_to dolar_url(@dolar)
  end

  test "should destroy dolar" do
    assert_difference('Dolar.count', -1) do
      delete dolar_url(@dolar)
    end

    assert_redirected_to dolars_url
  end
end
