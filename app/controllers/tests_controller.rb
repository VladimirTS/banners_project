class TestsController < ApplicationController

  def all_record
    @banner_positions = Banner.get_banners(params)
  end

  def test2; end

  def test3; end

  def test4; end

end