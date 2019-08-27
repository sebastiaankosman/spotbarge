class BargesController < ApplicationController
  def index
    @barges = Barge.all
  end

  def new
    raise
    @barge = Barge.new
  end

  def create

  end
end
