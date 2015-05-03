require 'deliver_asap/version'

module Mail
  class Message
    #
    # Performs delivery "as soon as possible" in a separate thread.
    # Using Rufus scheduler instead of just spawning a new thread since Rufus
    # already handles queueing and thread limits
    #
    def deliver_asap
      Rufus::Scheduler.s.in('0s') { deliver }
      self
    end
  end
end
