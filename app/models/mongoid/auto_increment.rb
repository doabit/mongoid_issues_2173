module Mongoid
  module AutoIncrement
    extend ActiveSupport::Concern

      included do
        field :_id,  :type => Integer, default: ->{ inc_id }
        before_create :inc_id
      end

      def inc_id
        Mongoid.default_session.command(findAndModify: "mongoid_autoinc_id",
                  query: {_id:self.class.name},
                  update: {"$inc" => {next:1}},
                  new: true,
                  upsert: true)["value"]['next'].to_s
      end

  end
end
