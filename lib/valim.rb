module Valim
  class FacepalmError < StandardError ; end
  class DoubleFacepalmError < FacepalmError ; end

  def have_doubts
    !!yield
  end
  extend self

  class Common
    def to_s
      "come on"
    end

    def js
      "common.js"
    end

    def method_missing(meth, *)
      "common.#{meth}"
    end
  end

  class Brodelizer
    def initialize(amount)
      @amount = amount
    end

    def to_s
      "brodel\n" * @amount
    end
  end
end

module Kernel
  def confirm
    !!self
  end
  alias :confirm? :confirm

  def deny
    !self
  end
  alias :deny? :deny

  def / o
    self
  end

  def confirm_deny?
    confirm?
  end

  def facepalm
    raise Valim::FacepalmError, "**facepalm**"
  end

  def double_facepalm
    raise Valim::DoubleFacepalmError, "**double-facepalm**"
  end

  def common
    Valim::Common.new
  end

  def brodelize(brodels)
    Valim::Brodelizer.new(brodels)
  end
end

class FalseClass
  def to_s
    "deny"
  end
end

class TrueClass
  def to_s
    "confirm"
  end
end
