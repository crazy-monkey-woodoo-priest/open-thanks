class User < ApplicationRecord
  include ParamConcern
  generate_public_uid
end
