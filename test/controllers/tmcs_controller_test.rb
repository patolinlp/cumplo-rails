require 'test_helper'

class TmcsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tmc = tmcs(:one)
  end

  test "should get index" do
    get tmcs_url
    assert_response :success
  end

  test "should get new" do
    get new_tmc_url
    assert_response :success
  end

  test "should create tmc" do
    assert_difference('Tmc.count') do
      post tmcs_url, params: { tmc: { fecha: @tmc.fecha, subtitulo: @tmc.subtitulo, tipo: @tmc.tipo, titulo: @tmc.titulo, valor: @tmc.valor } }
    end

    assert_redirected_to tmc_url(Tmc.last)
  end

  test "should show tmc" do
    get tmc_url(@tmc)
    assert_response :success
  end

  test "should get edit" do
    get edit_tmc_url(@tmc)
    assert_response :success
  end

  test "should update tmc" do
    patch tmc_url(@tmc), params: { tmc: { fecha: @tmc.fecha, subtitulo: @tmc.subtitulo, tipo: @tmc.tipo, titulo: @tmc.titulo, valor: @tmc.valor } }
    assert_redirected_to tmc_url(@tmc)
  end

  test "should destroy tmc" do
    assert_difference('Tmc.count', -1) do
      delete tmc_url(@tmc)
    end

    assert_redirected_to tmcs_url
  end
end
