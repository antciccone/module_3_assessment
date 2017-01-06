class BestbuyStores

  attr_reader :name, :city, :phone, :type, :distance, :id
  def initialize(service)
    @name     = service[:longName]
    @city     = service[:city]
    @phone    = service[:phone]
    @type     = service[:storeType]
    @distance = service[:distance]
    @id       = service[:storeId]
  end

  def self.stores(zip)
    BestbuyService.new.best_buy_stores(zip).map do |raw_info|
      BestbuyStores.new(raw_info)
    end
  end

end
