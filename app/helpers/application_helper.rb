module ApplicationHelper
  def last_week_date
    1.week.ago.strftime("%Y-%m-%d")
  end

  def today_date
    Date.today.strftime("%Y-%m-%d")
  end
end
