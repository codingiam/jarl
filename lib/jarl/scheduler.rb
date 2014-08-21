require 'jarl/event'

module Jarl
  class Scheduler
    def self.queue
      @queue ||= java.util.PriorityQueue.new
    end

    def self.time
      @time ||= 0
    end

    def self.schedule_entity(entity)
      self.schedule_event(Event.new(entity.time, nil, entity))
    end

    def self.schedule_event(event)
      self.queue.add(event)
    end

    def self.tick
      event = self.queue.peek
      if event
        @time = event.time
        self.queue.poll.tick
      end
      event != nil
    end
  end
end
