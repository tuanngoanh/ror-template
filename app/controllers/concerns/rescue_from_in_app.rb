module RescueFromInApp
  extend ActiveSupport::Concern

  included do
    rescue_from Redis::CannotConnectError, with: :error_connect_redis
    rescue_from Faraday::ConnectionFailed, with: :error_connect_elasticsearch
  end

  private
  def error_connect_redis(e)
    flash[:error]= ['Please run Redis first.', e.message].join('</br>').html_safe
    redirect_back(fallback_location: root_path)
  end

  def error_connect_elasticsearch(e)
    flash[:error]= ['Please run ElasticSearch first.', e.message].join('</br>').html_safe
    redirect_back(fallback_location: root_path)
  end
end
