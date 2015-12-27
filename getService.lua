
local Service = { };
local preferedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

function GetChildren(Object, Recursive)
  local function scan_insert(k, v, recurse)
    for _,x in pairs(v) do
      table.insert(k, x)
      if recurse then
          scan_insert(k, x:children(), true)
        end
      end
    return k;
  end
  return scan_insert(storedObjects, Object:GetChildren(), Recursive)
end
Service.GetChildren = GetChildren

function GetPlayer(Part)
  if Part:IsA("BasePart") then
    if Part.Parent and Part.Parent:IsA("Model") then
      return Players:GetPlayerFromCharacter(part.Parent);
    end
  end
  return nil
end
Service.GetPlayer = GetPlayer

function GetHumanoid(obj)
	if obj ~= nil then
		if obj.Parent and obj.Parent:IsA("Model") then
			return obj.Parent:findFirstChild("Humanoid")
		end
	end
end
Service.GetHumanoid = GetHumanoid

function GetRemote(remoteName, remoteType, isClient)
  if not isClient then
      local Remote = game:FindFirstChild(remoteName, true)
      if Remote and Remote:IsA(remoteType) then
        return Remote
      end
  elseif isClient then
    print("Yielding until found "..remoteName..remoteType..".")
    local Remote = game[preferedStorage]:WaitForChild(remoteName)
    return Remote
  end
end
Service.GetRemote = GetRemote
