class Booking < Base
  def self.end_point
    "#{ENV['SITE_URL']}/booking"
  end
end
