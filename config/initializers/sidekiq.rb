# frozen_string_literal

class SidekiqCron
  def self.load
    schedule_file = 'config/schedule.yml'
    h = YAML.load_file(schedule_file)
    Sidekiq::Cron::Job.load_from_hash(h) if File.exist?(schedule_file)
  end
end

Sidekiq.configure_server do |config|
  SidekiqCron.load
end
