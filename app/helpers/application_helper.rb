module ApplicationHelper
  def get_array_positions(entity)

  end

  def getHashControllers
    @controllers = {}

    ApplicationController.subclasses.each do |controller|
      @controllers[controller] = controller.action_methods.collect{|a| a.to_s}
    end

    @controllers
  end
end
