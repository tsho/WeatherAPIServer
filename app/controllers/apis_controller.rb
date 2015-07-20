class ApisController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  require 'json'

#    curl -v -H "Content-Type: application/json" http://0.0.0.0:3000/api -d '{"area" : "Tokyo"}'
#    '{"company":{"username":"xyz", "password":"abc"}}'

  def get
    if (request.headers["Content-type"] == "application/json")
      data = JSON.parse(request.raw_post)
      area = data["area"]
      logger.debug(data)
      logger.debug(area)

      respond_to do |format|
        msg = { :status => "ok", :message => "Success!", :country => data["country"], :area => data["area"]}
        format.json  { render :json => msg } # don't do msg.to_json
      end
#    logger.debug(data["company"])
#    logger.debug(data["username"])
    else
      render text: 'Not json'
    end
  end

  private
  def getInfo

  end
end
