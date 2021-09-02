module ProcessingsHelper
  def filter_analyses(analysises, typename)
    analysises.map{|analysis| analysis if analysis.typename == typename.to_s}.compact
  end
end
