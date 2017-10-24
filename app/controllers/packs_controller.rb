class PacksController < ApplicationController
  def new
    byebug
    @pack = Pack.new
  end
end
