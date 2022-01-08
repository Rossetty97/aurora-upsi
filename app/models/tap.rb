class Tap < ApplicationRecord
  belongs_to :service

  def usage
    return 0 if self.out_time.nil?
    outtime = self.out_time
    intime = self.in_time
    actualTime = outtime - intime
    usage = (actualTime/60.0).round.abs
  end

end