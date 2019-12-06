# frozen_string_literal: true

module Core
  module Resolvers
    class TournamentsResolver < ::BaseResolver
      type [Core::Types::TournamentType], null: false

      argument :search, String, required: false
      argument :location, String, required: false
      argument :start_date, Core::Types::TimeType, required: false

      def resolve(args)
        if !using_filters?(args)
          tournaments
        else
          filters = build_filters(args)
          Tournament.where(filters, includes: relations)
        end
      end

      private

      def tournaments
        @tournaments ||= Tournament.all(includes: relations)
      end

      def relations
        %i[tournament_placements rosters teams]
      end

      def build_filters(search: nil, location: nil, start_date: nil)
        filters = {}

        filters[:name] = ['ILIKE ?', "%#{search}%"] if search.present?
        filters[:location] = location if location.present?
        filters[:start_at] = ['>= ?', start_date.beginning_of_day] if start_date.present?

        filters
      end

      def using_filters?(args)
        args.any? do |_k, v|
          v.present?
        end
      end
    end
  end
end
