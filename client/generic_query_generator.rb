class GenericQueryGenerator
  def self.generate_post_body
    # Required order properties
    order = {}

    # Optional pizza delivery
    if [true, false].sample
      order[:deliver] = [true, false].sample
    end

    order.to_json
  end
end
