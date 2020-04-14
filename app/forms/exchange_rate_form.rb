class ExchangeRateForm
  include Virtus.model
  include ActiveModel::Validations

  attribute :expires_at, DateTime
  attribute :rate, Integer

  validates :expires_at, :rate, presence: true
  validates :rate, numericality: { greater_than: 0 }
  validate :time_expired

  def time_expired
    return if expires_at.blank?

    return if expires_at > Time.current

    errors.add(:expires_at, 'Expires at date can not be in past')
  end
end
