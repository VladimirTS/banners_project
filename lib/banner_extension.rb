module BannerExtension
  def acts_as_banner
    include InstanceMethods
    ############################ Class methods ################################
    has_one :banner, :as => :banner, :autosave => true, :dependent => :destroy
    alias_method_chain :banner, :build

    banner_attributes = Banner.content_columns.map(&:name) #<-- gives access to all columns of Business

    # define the attribute accessor method
    def banner_attr_accessor(*attribute_array)
      attribute_array.each do |att|
        define_method(att) do
          banner.send(att)
        end
        define_method("#{att}=") do |val|
          banner.send("#{att}=",val)
        end
      end
    end
    banner_attr_accessor *banner_attributes #<- delegating the attributes
  end

  module InstanceMethods
    def banner_with_build
      banner_without_build || build_banner
    end
  end
end