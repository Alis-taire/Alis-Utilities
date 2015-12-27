
local Service = { };

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

function GetPlayerFromPart(Part)
  if Part:IsA("BasePart") then
    if Part.Parent and Part.Parent:IsA("Model") then
      return game.Players:GetPlayerFromCharacter(part.Parent);
    end
  end
  return nil
end
service.GetPlayerFromPart = GetPlayerFromPart
