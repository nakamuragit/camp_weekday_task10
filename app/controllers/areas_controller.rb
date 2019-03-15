class AreasController < ApplicationController
  include AreasHelper

  def index
    @areas = Area.all
  end

  def search
    @area = Area.new
    zipcode = params[:zipcode]
    @hash = research(zipcode)
    if @hash["status"].to_i != 200 && @hash["status"]
      flash.now[:alert] = "#{@hash["message"]}"
      @hash = nil
    else 
      @zipcode = @hash["results"][0]["zipcode"]
      @prefcode = @hash["results"][0]["prefcode"]
      @address1 = @hash["results"][0]["address1"]
      @kana1 = @hash["results"][0]["kana1"]
      @address2 = @hash["results"][0]["address2"]
      @kana2 = @hash["results"][0]["kana2"]
      @address3 = @hash["results"][0]["address3"]
      @kana3 = @hash["results"][0]["kana3"]
    end
  end

  def create 
    @area = Area.new(area_params)
    if @area.save
      redirect_to root_path, notice: "地域を登録しました。"
    else 
      redirect_to "/areas/search?zipcode=#{params[:area][:zipcode]}", alert: "Validation failed: #{@area.errors.full_messages[0]}"
    end
  end

  private
  def area_params
    params.require(:area).permit!
  end
end
