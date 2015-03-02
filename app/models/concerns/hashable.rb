module Hashable
  def all_to_hash
    all.each_with_object({}) { |item, memo| memo[item.id] = item }
  end
end
