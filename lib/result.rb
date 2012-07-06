class Result
  attr_accessor :term, :dictionaries, :translations, :examples
  def initialize(term, dictionaries = nil)
    @term = term
    @dictionaries = dictionaries
    @translations = {}
    @examples = {}
  end
  
  def add_translation(term, translation)
    add_result(@translations, term, translation)
  end
  
  def add_example(term, example)
    add_result(@examples, term, example)
  end
  
  def each_translation
    @translations.each_pair do |term,translation|
      yield term, translation
    end
  end
  
  private
  def add_result(hash, key, value)
    if hash.has_key?(key)
      hash[key].push(value)
    else
      hash.merge!({ key => [value] })
    end
    self
  end
end
