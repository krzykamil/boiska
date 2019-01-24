module Searches
  class CourtSearch < BaseSearch
    FIELDS = %i[
      district school subsoil_type
    ].freeze
    attr_accessor(*FIELDS)

    def search
      courts = Court.all
      courts = courts.where(district: @district) if @district.present?
      courts = courts.where('school LIKE ?', "%#{@school}%") if @school.present?
      courts = courts.where(subsoil_type: @subsoil_type) if @subsoil_type.present?
      courts
    end
  end
end
