class LineupDecorator < Draper::Decorator
  delegate_all

  def association_text
    " #{lineup.start_time.strftime('%H:%M')} [#{lineup.channel.code}]#{lineup.channel.name}"
  end
end
