module Jarl
  class Event
    include java.lang.Comparable

    attr_reader :time, :source, :destination, :params

    def initialize(time, source, destination, params = nil)
      raise 'time should be >= 0' unless time >= 0
      @time = Jarl::Scheduler.time + time
      @source = source
      @destination = destination
      @params = params
    end

    def compare_to(o)
      time <=> o.time
    end

    def tick
      destination.tick(self)
    end
  end
end
