require 'jarl/version'

require 'jarl/scheduler'
require 'jarl/counting_entity'

module Jarl
  def self.main
    Jarl::Scheduler.schedule_entity(Jarl::CountingEntity.new(0, 5, 250))
    Jarl::Scheduler.schedule_entity(Jarl::CountingEntity.new(6, 10, 500))

    loop do
      break unless Jarl::Scheduler.tick
    end
  end
end
