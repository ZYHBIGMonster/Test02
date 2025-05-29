--[[------------------------------------------倒计时定时器------------------------------------------------------]]--
local Action_RemainTimer = 
{
    Time = 0;
    StartNotifyEvent = "";
    UpdateNotifyEvent = "";
    EndNotifyEvent = "";
    StopEvent = "";
    UpdateIntervalTime = 1;
}

function Action_RemainTimer:Execute()
    print(string.format("Action_RemainTimer:Execute Time[%d], StartNotifyEvent[%s], UpdateNotifyEvent[%s], EndNotifyEvent[%s], StopEvent[%s], UpdateIntervalTime[%d]",
        self.Time, self.StartNotifyEvent, self.UpdateNotifyEvent, self.EndNotifyEvent, self.StopEvent, self.UpdateIntervalTime));
    print("GameStartDone");
    print("FakerVSBin");
    self.EnterStateTime = GameplayStatics.GetRealTimeSeconds(self);
    self.bEnableActionTick = true;

    if self.StartNotifyEvent ~= "" then
        LuaQuickFireEvent(self.StartNotifyEvent, self);
    end

    if self.UpdateNotifyEvent ~= "" then
        LuaQuickFireEvent(self.UpdateNotifyEvent, self, self.Time);
        self.LastUpdateRemainTime = self.Time;
    end

    if self.StopEvent ~= "" then
        LuaRegisterEvent(self.StopEvent, self, "Stop");
    end

	return true;
end

function Action_RemainTimer:Update(DeltaTime)

    --ugcprint("Miao");

    local CurrentRealTime = GameplayStatics.GetRealTimeSeconds(self);
    local RemainTime = self.Time - (CurrentRealTime - self.EnterStateTime);

    if RemainTime < 0 then
        RemainTime = 0;
    end

    local CurrentUpdateRemainTime = math.ceil(RemainTime);

    if self.UpdateNotifyEvent ~= "" then
        if self.LastUpdateRemainTime - CurrentUpdateRemainTime >= self.UpdateIntervalTime then
            LuaQuickFireEvent(self.UpdateNotifyEvent, self, CurrentUpdateRemainTime);
            --ugcprint("变色");
            self.LastUpdateRemainTime = CurrentUpdateRemainTime;
        end
    end

    if CurrentUpdateRemainTime <= 0 then
        self:TimerEnd();
	end
end

function Action_RemainTimer:TimerEnd()
    print(string.format("Action_RemainTimer:TimerEnd Time[%d], StartNotifyEvent[%s], UpdateNotifyEvent[%s], EndNotifyEvent[%s], StopEvent[%s], UpdateIntervalTime[%d]",
        self.Time, self.StartNotifyEvent, self.UpdateNotifyEvent, self.EndNotifyEvent, self.StopEvent, self.UpdateIntervalTime));

    self.bEnableActionTick = false;

    if self.StopEvent ~= "" then
        LuaUnRegisterEvent(self.StopEvent, self);
    end

    if self.stopped then
        return
    end

    if self.EndNotifyEvent ~= "" then 
        LuaQuickFireEvent(self.EndNotifyEvent, self) 
    end
end

function Action_RemainTimer:Stop()
    print(string.format("Action_RemainTimer:Stop Time[%d], StartNotifyEvent[%s], UpdateNotifyEvent[%s], EndNotifyEvent[%s], StopEvent[%s], UpdateIntervalTime[%d]",
        self.Time, self.StartNotifyEvent, self.UpdateNotifyEvent, self.EndNotifyEvent, self.StopEvent, self.UpdateIntervalTime));

    self.stopped = true
    self:TimerEnd();
    self.stopped = false
end

return Action_RemainTimer