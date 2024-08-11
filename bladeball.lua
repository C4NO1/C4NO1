local function startAutoParry()
    local localPlayer = game.Players.LocalPlayer
    local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
    local ballsFolder = workspace:WaitForChild("Balls")
    local replicatedStorage = game:GetService("ReplicatedStorage")
    local parryButtonPress = replicatedStorage.Remotes.ParryButtonPress
    local abilityButtonPress = replicatedStorage.Remotes.AbilityButtonPress

    print("Script successfully ran.")

    local function onCharacterAdded(newCharacter)
        character = newCharacter
    end

    local AutoParry = {} -- Assume AutoParry is defined elsewhere

    local CloseFighting = AutoParry:CreateSection("Close Fighting")
    local SpamParry = AutoParry:CreateKeybind({
        Name = "Spam Parry (Hold)",
        CurrentKeybind = "C",
        HoldToInteract = true,
        Flag = "ToggleParrySpam",
        Callback = function(Keybind)
            local function click(a)
                local virtualInput = game:GetService("VirtualInputManager")
                virtualInput:SendMouseButtonEvent(a.AbsolutePosition.X + a.AbsoluteSize.X / 2, a.AbsolutePosition.Y + 50, 0, true, a, 1)
                virtualInput:SendMouseButtonEvent(a.AbsolutePosition.X + a.AbsoluteSize.X / 2, a.AbsolutePosition.Y + 50, 0, false, a, 1)
            end
            click(localPlayer.PlayerGui.Hotbar.Block.Pressable1)
        end,
    })

    local Configuration = AutoParry:CreateSection("Configuration")
    local DistanceSlider = AutoParry:CreateSlider({
        Name = "Distance Configuration",
        Range = {0, 100},
        Increment = 1,
        Suffix = "Distance",
        CurrentValue = 20,
        Flag = "DistanceSlider",
        Callback = function(Value)
            sliderValue = Value
        end,
    })

    local ToggleParryOn = AutoParry:CreateKeybind({
        Name = "Parry On/Off",
        CurrentKeybind = "One",
        HoldToInteract = false,
        Flag = "ToggleParryOn",
        Callback = function(Keybind)
            AutoParryToggle:Set(not AutoParryToggle.CurrentValue)
        end
    })

    local Configuration2 = AutoParry:CreateSection("Configuration2")
    local ChangeDistanceToThirty = AutoParry:CreateKeybind({
        Name = "Change Distance to 30",
        CurrentKeybind = "V",
        HoldToInteract = false,
        Flag = "Distanceto30",
        Callback = function(Keybind)
            DistanceSlider:Set(30)
        end,
    })

    local ChangeDistanceToHundred = AutoParry:CreateKeybind({
        Name = "Change Distance to 100",
        CurrentKeybind = "B",
        HoldToInteract = false,
        Flag = "Distanceto100",
        Callback = function(Keybind)
            DistanceSlider:Set(100)
        end,
    })
end
