class Answer
  include ActiveAttr::Model

  attribute :answers
  validate :size_of_answers

  def results
    types = {e: 0, i: 0, n: 0, s: 0, f: 0, t: 0, p: 0, j: 0}
    self.answers.each do |number, answer|
      letter = QUESTIONS[number.to_i-1][answer]["letter"].to_sym
      types[letter] += 1
    end

    ei = {e: types[:e], i: types[:i]}
    ns = {n: types[:n], s: types[:s]}
    ft = {f: types[:f], t: types[:t]}
    pj = {p: types[:p], j: types[:j]}

    type = ""
    [ei, ns, ft, pj].each do |group|
      type << group.sort_by {|key, value| value}.reverse.first.first.to_s.upcase # OMGWTFBBQ, this is disgusting
    end
    type
  end

  private
    def size_of_answers
      QUESTIONS.each_with_index do |question, i|
        errors[:base] << "Please answer question #{i+1}" if self.answers.nil? or self.answers["#{i}"].nil?
      end
    end
end