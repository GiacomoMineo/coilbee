class Api::V1::LibrariesSerializer < Api::V1::BaseSerializer
	extend FriendlyId
	friendly_id :topic, use: [:slugged, :finders]
end