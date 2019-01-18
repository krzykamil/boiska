class Searches::BaseSearch
  include ActiveModel::Model

  def initialize(attrs = {})
    unless attrs.blank?
      attrs.each do |key, val|
        send("#{key}=", val)
      end
    end
  end

  def persisted?
    false
  end
end
