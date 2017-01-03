class FacebookPage < ApplicationRecord
  GRAPH_URL = "https://graph.facebook.com/v2.8"
  AUTH_TOKEN = "EAACEdEose0cBABW6ukdU2YoZC5BBNq2ZBtK6vgI8bUiDyxLQuWWyizzieLIHPMLrFR56L5rhHeYvYYY3ZCqr9BDhQKT1OnL8mKXZBcx5SropNRXBUKDGmvokRFjYt5JPIrf6IFgxvd54h2EKbbqZBZAjjuTCqDpYUW2wDADoz3SAZDZD"
  before_save :update_name

  private

  def update_name
    res = RestClient.get("#{GRAPH_URL}/#{fb_id}", params: {access_token: AUTH_TOKEN})
    self.name = JSON.parse(res.body)["name"]
  rescue Exception => e
    puts e
    false
  end
end
