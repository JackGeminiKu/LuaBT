require("Base/Action")
BT.Wait = {
    base = BT.Action
}
local this = BT.Wait

this.__index = this
setmetatable(this, this.base)

function BT.Wait:New(name, time)
    local o = this.base:New(name)
    o.fTime = time or 1
    o.fStartTime = 0
    setmetatable(o, this)
    return o
end

function BT.Wait:OnStart()
    self.fStartTime = 0
end

function BT.Wait:OnUpdate()
    if self.fStartTime == 0 then
        self.fStartTime = os.time()
    end

    if os.time() - self.fStartTime >= self.fTime then
        return BT.ETaskStatus.Success
    else
        return BT.ETaskStatus.Running
    end
end
