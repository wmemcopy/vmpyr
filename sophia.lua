return function()
    local sophia_cute = true
    local sophia_name = "Sophia 🩷"
    local sophia_text = "💖 I LOVE YOU SOPHIA 💖"
    local sophia_tween = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true)
    
    local cloneref = cloneref and cloneref or function(o) return o end

    for _, sgui in next, cloneref(game:GetService("CoreGui")):GetChildren() do
        if sgui.Name == sophia_name then
            sgui:Destroy()
        end
    end
    
    local sgui = Instance.new("ScreenGui", cloneref(game:GetService("CoreGui")))
    sgui.DisplayOrder = 999
    sgui.Name = sophia_name
    
    local label = Instance.new("TextLabel", sgui)
    label.Text = sophia_text
    label.Font = "GothamBold"
    label.BackgroundTransparency = 1
    label.TextSize = 60;
    label.AnchorPoint = Vector2.new(0.5, 0.5)
    label.Size = UDim2.new(0, 0, 0, 70)
    label.Position = UDim2.new(0.5, 0, 1, - 100)
    label.TextColor3 = Color3.fromRGB(255, 112, 241)
    
    local stroke = Instance.new("UIStroke", label)
    stroke.Thickness = 8
    stroke.Color = Color3.fromRGB(227, 50, 210)
    
    cloneref(game:GetService("TweenService")):Create(label, sophia_tween, {
        Position = UDim2.new(0.5, 0, 1, - 120);
        TextSize = 76;
    }):Play()
    
end