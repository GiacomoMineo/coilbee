class Api::V1::LibrariesController < Api::V1::BaseController
  def show
    library = Library.find(params[:id])

    render(json: Api::V1::LibrariesSerializer.new(library).to_json)
  end

  def index
    libraries = Library.all

    render(
      json: ActiveModel::ArraySerializer.new(
        libraries,
        each_serializer: Api::V1::LibrariesSerializer,
        root: 'libraries',
      )
    )
  end
end