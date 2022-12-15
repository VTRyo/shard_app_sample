class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  connects_to shards: {
    default: { writing: :master },
    shard_one: { writing: :shard_one },
    shard_two: { writing: :shard_two }
  }
end
