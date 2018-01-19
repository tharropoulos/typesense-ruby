module Typesense
  class Documents
    def self.create(collection_name, document)
      ApiCall.new.post(Collections.documents_path_for(collection_name), document)
    end

    def self.retrieve(collection_name, document_id)
      ApiCall.new.get("#{Collections.documents_path_for(collection_name)}/#{document_id}")
    end

    def self.delete(collection_name, document_id)
      ApiCall.new.delete("#{Collections.documents_path_for(collection_name)}/#{document_id}")
    end

    def self.export(collection_name)
      api_response = ApiCall.new.get_unparsed_response("#{Collections.documents_path_for(collection_name)}/export")

      api_response.split("\n").map do |document_json_string|
        JSON.parse(document_json_string)
      end
    end

    def self.search(collection_name, search_parameters)
      ApiCall.new.get("#{Collections.documents_path_for(collection_name)}/search", search_parameters)
    end
  end
end