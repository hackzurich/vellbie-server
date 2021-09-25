# frozen_string_literal: true

module FitRockr
  # FitRockr::Import
  class Import
    include Interactor

    def call
      context.query = { startDate: '2021-09-24', endDate: '2021-09-25' }
      context.interface = ::FitRockrInterface.new(query: context.query).stress
      context.fail!(error: Message.bad_request) unless context.interface.status.eql? 200
    end

    after do
      json = JSON.parse context.interface.body

      json.each do |data|
        stress = StressDatum.find_by(uid: data['uid'])

        stress.nil? && StressDatum
          .create!(
            user: User.last,
            stress_level: data['stressLevelValue'],
            uid: data['id'],
            meta: data,
            calendar_date: data['calendarDate']
          )
      end
    end
  end
end
