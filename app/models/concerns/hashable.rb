module Hashable
  def all_to_hash
    all.each_with_object({}) do |item, memo|
      memo[item.id] = item
      memo
    end
  end
end
