require 'jarl/entity'
require 'jarl/event'
require 'jarl/scheduler'

module Jarl
  class CountingEntity < Entity
    attr_reader :from, :to, :time

    def initialize(from, to, time)
      raise 'From should be >= to' unless to >= from
      @from = from
      @to = to
      @time = time
    end

    def tick(event)
      @current = @current.nil? ? @from : @current + 1
      puts "@current = #{@current}"
      Jarl::Scheduler.schedule_event(Event.new(time, self, self)) if @current < @to
    end
  end
end