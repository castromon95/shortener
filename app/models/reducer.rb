class Reducer < ApplicationRecord

  validates :token,
            presence: {message: 'field is mandatory'},
            length: {minimum: 1, message: 'must have at least 1 character'}
  validates :url,
            presence: {message: 'field is mandatory'},
            length: {minimum: 10, message: 'must be at least 10 characters long'},
            format: { with: /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/ix, message: "must be valid" }
  validates :count,
            numericality: { only_integer: true, greater_than_or_equal_to: 0, message: 'must be a positive valid integer.' },
            on: :update

  before_create do
    self.count ||= 0
  end

  def self.url_exists?(url)
    find_by_url(url)
  end

  def self.top_100
    order(count: :desc).limit(100)
  end

  def reduced_url
    "#{Rails.configuration.action_mailer.default_url_options[:host]}#{self.token}"
  end

end
