-- Цветовые кружки
    local colors = {
        Color3.new(1, 0, 0),   -- Красный
        Color3.new(0, 1, 0),   -- Зеленый
        Color3.new(0, 0, 1),   -- Синий
        Color3.new(1, 1, 0),   -- Желтый
        Color3.new(1, 0.5, 0), -- Оранжевый
        Color3.new(0.5, 0, 0.5), -- Фиолетовый
        Color3.new(0.5, 0.5, 0.5)  -- Серый
    }

    local function createColorCircle(color, position)
        local colorCircle = Instance.new("TextButton")
        colorCircle.Size = UDim2.new(0, 50, 0, 50)
        colorCircle.Position = position
        colorCircle.BackgroundColor3 = color
        colorCircle.Text = ""
        colorCircle.Parent = colorPickerFrame
        colorCircle.BorderSizePixel = 0
        colorCircle.BackgroundTransparency = 0

        colorCircle.MouseButton1Click:Connect(function()
            highlightColor = color
            if highlightEnabled then
                highlightPlayers(true)
            end
        end)
    end

    -- Размещение кружков
    for i, color in ipairs(colors) do
        local row = math.floor((i - 1) / 3)
        local col = (i - 1) % 3
        createColorCircle(color, UDim2.new(0.1 + col * 0.3, 0, 0.1 + row * 0.4, 0))
    end

    -- Кнопка "Назад" в окне выбора цвета
    local backButton = Instance.new("TextButton")
    backButton.Size = UDim2.new(0.8, 0, 0, 40)
    backButton.Position = UDim2.new(0.1, 0, 0.9, 0)
    backButton.Text = "Назад"
    backButton.Font = Enum.Font.SourceSansBold
    backButton.TextSize = 16
    backButton.TextColor3 = Color3.new(1, 1, 1)
    backButton.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
    backButton.Parent = colorPickerFrame

    backButton.MouseButton1Click:Connect(function()
        colorPickerFrame.Visible = false
    end)

    -- Открытие выбора цвета
    colorButton.MouseButton1Click:Connect(function()
        colorPickerFrame.Visible = true
    end)

        -- Кнопка выключения скрипта
    local disableButton = Instance.new("TextButton")
    disableButton.Size = UDim2.new(0.8, 0, 0, 25)
    disableButton.Position = UDim2.new(5.3, 0, 0.04, 0)
    disableButton.Text = "Unload"
    disableButton.Font = Enum.Font.SourceSans
    disableButton.TextSize = 16
    disableButton.TextColor3 = Color3.new(1, 1, 1)
    disableButton.BackgroundColor3 = Color3.new(0.8, 0.1, 0.1)
    disableButton.BackgroundTransparency = 0.1
    disableButton.Parent = menuFrame

    disableButton.MouseButton1Click:Connect(function()
        scriptEnabled = false
        highlightEnabled = false
        highlightPlayers(false) -- Отключаем подсветку
        screenGui:Destroy() -- Удаляем меню
    end)

    -- Текст внизу по центру
    local bottomText = Instance.new("TextLabel")
    bottomText.Size = UDim2.new(1, 0, 0, 100)
    bottomText.Position = UDim2.new(0, 0, 1, -150)
    bottomText.Text = "@scriptandgames"
    bottomText.Font = Enum.Font.SourceSansBold
    bottomText.TextSize = 72
    bottomText.TextColor3 = Color3.new(1, 1, 1)
    bottomText.BackgroundTransparency = 1
    bottomText.TextTransparency = 0.5
    bottomText.Parent = screenGui
end

-- Инициализация меню
createMenu()