class Authorise < Base
  class << self
    def end_point
      "#{ENV['SITE_URL']}/auth"
    end

    def post_credentials(payload)
      rest_call(:post,
                url: self.end_point,
                payload: payload,
                headers: {content_type: :json})
    end
  end
end
