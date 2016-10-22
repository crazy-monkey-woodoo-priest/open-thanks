module ParamConcern
  module ClassMethods
    def find_param(public_uid)
      find_by!(public_uid: public_uid)
    end
  end

  extend ActiveSupport::Concern

  included do
    extend ParamConcern::ClassMethods
  end

  def to_param
    public_uid
  end
end
