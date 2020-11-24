-- Settings --
local waittime = 5 -- How long doors will be open (you must set speed and you must set wait time in card reader
local doorspeed = 1 -- Door Speed
































--------------------------------------------------------------------------------------------
-- Ignore this down here its the door's system --
-- Dont touch!!! --


--Locations--
local l = script.Parent.MotorL
local r = script.Parent.MotorR
local value = script.Parent.Open
local lock = script.Parent.Lock




-- Door Speed --
script.Parent.MotorL.Hinge.AngularSpeed = doorspeed
script.Parent.MotorR.Hinge.AngularSpeed = doorspeed

---------------------------------------------------



-- Door Lock --
	
script.Parent.Open.Changed:Connect(function(a)
	if a == false then
		lock.Lock1.Lig.Color = Color3.fromHSV(0.347028, 1, 0.811765)
		lock.Lock2.Lig.Color = Color3.fromHSV(0.347028, 1, 0.811765)
		wait(waittime)
		lock.Lock1.Lock.Locking.Enabled = true
		lock.Lock2.Lock.Locking.Enabled = true
		lock.Lock1.Lig.Color = Color3.fromHSV(0, 0, 1)
		lock.Lock2.Lig.Color = Color3.fromHSV(0, 0, 1)
	elseif script.Parent.Open.Value == true then
		lock.Lock1.Lock.Locking.Enabled = false
		lock.Lock2.Lock.Locking.Enabled = false
		lock.Lock1.Lig.Color = Color3.fromHSV(0, 1, 0.796078)
		lock.Lock2.Lig.Color = Color3.fromHSV(0, 1, 0.839216)
	end
end)
------------------------------------------------------------------------------

-- Door Movement --	
value.Changed:Connect(function(o)
	if o == false then --Door close
		r.Hinge.TargetAngle = 0
		l.Hinge.TargetAngle = 0
		wait(5)
		script.Parent.Lock.locked.Value = false
		-------------------------
	elseif value.Value == true then --Door open
		r.Hinge.TargetAngle = 90
		l.Hinge.TargetAngle = -90
		script.Parent.Lock.locked.Value = true
		-------------------------
	end
end)
------------------------------------------------

-- Sensor --
function onTouch(hit)
	script.Parent.Open.Value = true
	wait(3)
	script.Parent.Open.Value = false
end 
script.Parent.Sensor.Touched:connect(onTouch)
---------------------------------------------
