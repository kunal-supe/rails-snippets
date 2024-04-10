class EmaWorker

  include Sidekiq::Worker
  sidekiq_options backtrace: true

  def perform
    day = EmaCandle.find_by_symbol('BTCUSDT').present? ? EmaCandle.find_by_symbol('BTCUSDT').day : Date.today.to_s  
    Coin.all.each do |coin|
      get_candle_details(coin)
    end  
  end

  def get_candle_details(coin)
    # logic for fetching/storing data
  end  

end

# Enqueue the task using below command

EmaWorker.new.perform