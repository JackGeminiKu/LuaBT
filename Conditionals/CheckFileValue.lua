require("Base/Conditional")
BT.CheckFileValue = {
    Base = BT.Conditional
}
local this = BT.CheckFileValue
this.__index = this
setmetatable(this, this.Base)

function BT.CheckFileValue:New(name, value)
    local o = this.Base:New(name)
    o.value = value
    setmetatable(o, this)
    return o
end

function BT.CheckFileValue:OnUpdate()
    local file = io.open("D:\\lua.txt", "r")
    local value = file:read()
    if value == self.value then
        return BT.ETaskStatus.Success
    else
        return BT.ETaskStatus.Failure
    end
end
