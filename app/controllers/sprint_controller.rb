class SprintController < ApplicationController
  def current
    render json: {
      name: current_sprint.Name,
      starts: format_date(current_sprint.StartDate),
      ends: format_date(current_sprint.EndDate)
    }
  end

  private

  def current_sprint
    @current_sprint ||= rally.find(current_sprint_query).results.first.read
  end

  def rally
    @rally ||= RallyAPI::RallyRestJson.new({username: ENV['RALLY_USERNAME'], password: ENV['RALLY_PASSWORD'], workspace: ENV['RALLY_WORKSPACE']})
  end

  def current_sprint_query
    current_date = Time.now.utc.strftime('%Y-%m-%d')
    RallyAPI::RallyQuery.new(type: 'iteration', query_string: "((EndDate > #{current_date}) AND (StartDate < #{current_date}))")
  end

  def format_date(date)
    ActiveSupport::TimeZone['Central Time (US & Canada)'].at(Time.parse(date)).strftime('%m/%d/%y')
  end
end
