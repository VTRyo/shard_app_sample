class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    create_item_id

    ActiveRecord::Base.connected_to(role: :writing, shard: shard_key) do
      @item = Item.create({
                            id: item_id,
                            name: item_params[:name],
                            office_id: item_params[:office_id]
                          })
    end

    redirect_to items_path
  end

  def index
    ActiveRecord::Base.connected_to(shard: :shard_two) do
      @items = Item.all
    end
  end

  private

  def create_item_id
    latest_id = IdTable.last.id + 1
    ActiveRecord::Base.connected_to(shard: :default) do
      IdTable.create!(id: latest_id, table_name: "items")
    end
  end

  def item_id
    ActiveRecord::Base.connected_to(shard: :default) do
      IdTable.where(table_name: 'items').last.id
    end
  end

  def shard_key
    ActiveRecord::Base.connected_to(shard: :default) do
      shard_key = ShardManage.find_by(office_id: item_params[:office_id]).shard_name
      shard_key.to_sym
    end
  end

  def item_params
    params.require(:item).permit(:name, :office_id)
  end

end
