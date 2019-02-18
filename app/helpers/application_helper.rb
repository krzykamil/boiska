module ApplicationHelper
  include Pagy::Frontend
  Pagy::VARS[:items] = 10
end
