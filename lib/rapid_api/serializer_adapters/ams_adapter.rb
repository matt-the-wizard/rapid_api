module RapidApi
  module SerializerAdapters
    class AmsAdapter < Abstract

      def serialize(member)
        serializer = klass.new(member)
        ActiveModelSerializers::Adapter.create(serializer).to_json
      end

      def serialize_collection(collection)
        collection_serializer = ActiveModel::Serializer::CollectionSerializer.new collection, {
                             each_serializer: klass
                           }
        ActiveModelSerializers::Adapter.create(collection_serializer).to_json
      end

    end
  end
end
