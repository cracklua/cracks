local data = {}

data.SetDraggable = function (frame, parent)
  parent = parent or frame
  local dragging = false
  local dragInput, mousePos, framePos
  
  frame.InputBegan:Connect(function (input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
      dragging = true
      mousePos = input.Position
      framePos = parent.Position
      
      input.Changed:Connect(function ()
        if input.UserInputState == Enum.UserInputState.End then
          dragging = false
        end
      end)
    end
  end)
  
  frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
      dragInput = input
    end
  end)
  
  frame.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
      local delta = input.Position - mousePos
      parent.Position  = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
    end
  end)
end

return data