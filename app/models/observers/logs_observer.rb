class LogsObserver < ActiveRecord::Observer
  #observe :user, :client, :employee, :admin

  # def after_save(record)
    ## Example Observer

    ## Attributes record
    # attr_id = record.id
    # class_name = record.class.name
    # method_name = record.new_record? ? 'create' : 'update'

    ##Create new log
    # log = Log.new
    # log.attr_id = attr_id 
    # log.class_name = class_name 
    # log.method_name = method_name 
    # log.save
  # end

end