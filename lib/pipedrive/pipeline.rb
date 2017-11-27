module Pipedrive
  class Pipeline < Base
    include ::Pipedrive::Operations::Create
    include ::Pipedrive::Operations::Read
    include ::Pipedrive::Operations::Update
    include ::Pipedrive::Operations::Delete

    def get_deals(pipeline_id, stage_id)
      params = {
          id: pipeline_id,
          stage_id: stage_id
      }

      return to_enum(:get_deals, pipeline_id,stage_id) unless block_given?
      follow_pagination(:make_api_call, [:get, "#{pipeline_id}/deals"], params) { |item| yield item }
    end
  end
end
