require 'rest-client'

class Base
  class << self
    def all
      rest_call(:get)
    end

    def get(id, accept)
      rest_call(:get, url: "#{self.end_point}/#{id}",
                      headers: {accept: accept})
    end

    def create(payload, content_type)
      rest_call(:post, payload: payload,
                       headers: {accept: :json, content_type: content_type})
    end

    def delete(id, token)
      rest_call(:delete, url: "#{self.end_point}/#{id}",
                         headers: {cookie: "token=#{token}"})
    end

    private

    def rest_call(action, url: self.end_point, payload: nil, headers: {})
      case action
      when :post, :patch, :put
        RestClient.send(action, url, payload, headers)
      else
        RestClient.send(action, url, headers)
      end
    rescue => e
      e.response
    end
  end
end