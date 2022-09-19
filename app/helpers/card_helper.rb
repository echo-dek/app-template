module CardHelper
  def card(id: "", cls: "", title: "", &block)
    tag.div id: id, class: 'card #{cls}' do
      tag.div class: "card-body" do
        tag.h5(class: "card-title") { title.to_s } unless title.to_s.blank?
        capture(&block) unless block.nil?
      end
    end
  end
end
