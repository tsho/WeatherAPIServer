class ApisController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  require 'json'

#    curl -v -H "Content-Type: application/json" http://0.0.0.0:3000/api -d '{"area" : "Tokyo"}'
#curl -v -H "Content-Type: application/json" http://0.0.0.0:3000/getweatherinfo -d '{"area":"Tokyo"}'
  def get
    if (request.headers["Content-type"] == "application/json")
      data = JSON.parse(request.raw_post)
      area = data["area"]
      logger.debug(data)
      logger.debug(area)

      respond_to do |format|
        msg = { :status => "ok", :message => "Success!", :area => data["area"],  :prediction => getInfo(area)}
        format.json  { render :json => msg }
      end
    else
      render text: 'Not json'
    end
  end

  private
  def getInfo(area)
    @Prediction = Prediction.all
    return @Prediction.find_by_prefecture(area).prediction
  end
end
