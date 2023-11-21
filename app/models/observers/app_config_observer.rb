class AppConfigObserver < ActiveRecord::Observer
  observe :gym

  def after_create(record)
    AppConfig.create(gym_id: record.id)
  end

end