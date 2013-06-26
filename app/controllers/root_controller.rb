require 'weather'
require 'foot_ball'

class RootController < ApplicationController
  def index
    @weather_list = Weather.list("./public/weather.dat", (8..38))

    foot_ball_list = FootBall.list("./public/football.dat", (5..25))
    @foot_ball_min = FootBall.select_min_by(foot_ball_list, "difference")
    @foot_ball_list = FootBall.sort_by(foot_ball_list, "difference")
  end
end
