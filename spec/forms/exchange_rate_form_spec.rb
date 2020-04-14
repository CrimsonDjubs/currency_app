require 'rails_helper'

RSpec.describe ExchangeRateForm do
  describe '.valid?' do
    it 'if all attrs present' do
      form = described_class.new(rate: 75, expires_at: Time.current + 1.minute)
      expect(form.valid?).to eq(true)
    end
  end

  describe '.invalid?' do
    it 'without rate' do
      form = described_class.new(expires_at: Time.current + 20.minute)
      expect(form.invalid?).to eq(true)
    end

    it 'without expires_at' do
      form = described_class.new(rate: 75)
      expect(form.invalid?).to eq(true)
    end

    it 'expires_at in past' do
      form = described_class.new(rate: 75, expires_at: 1.day.ago)
      expect(form.invalid?).to eq(true)
    end

    it 'with rate = 0' do
      form = described_class.new(rate: 0, expires_at: Time.current + 20.minutes)
      expect(form.invalid?).to eq(true)
    end
  end
end
