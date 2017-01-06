class BestbuyHours

    attr_reader :hours, :type
  def initialize(service)
    @hours    = service[:hours]
    @type     = service[:storeType]
  end

  def self.hours(id)
    info = BestbuyService.new.best_buy_hours(id)
      BestbuyHours.new(info)
  end

end
