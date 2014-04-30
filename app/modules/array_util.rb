module ArrayUtil
  ##
  # Merge an array of object into a single unified object.
  # @param [Array<Hash>] array
  # @return [Hash] The merged object
  def merge_object_array(array)
    array.each_with_object({}) do |hash, acc|
      acc[hash.keys.first] = hash.values.first
    end
  end
end