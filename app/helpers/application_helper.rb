module ApplicationHelper
  def current_year(now: Time.zone.now)
    now.year
  end

  def current_quarter(now: Time.zone.now)
    now.month / 3 + ((now.month % 3).zero? ? 0 : 1)
  end
end
