class SprintController < ApplicationController
  def current
    render json: HTTParty.get('http://still-atoll-1597.herokuapp.com/sprint/current')
  end
end
