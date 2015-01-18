--[=[-------------------------------------------------------------------------------------------
║                              Trouble in Terrorist Town Glows								   ║
║                                  	By: Lemur & Tommy 					   					   ║
║                                                                                              ║
---------------------------------------------------------------------------------------------]=]
local msg_name = "Halos_inform"

if SERVER then
	AddCSLuaFile()
	
	util.AddNetworkString(msg_name)
	
	hook.Add("PlayerDeath", "PlayerDeathHalos", function(ply)
		net.Start(msg_name)
		net.WriteEntity(ply)
		net.Send(GetTraitors())
	end)
	


	local rolestable = {}

	hook.Add("TTTEndRound", "TTTEndRoundResetTable", function()
		table.Empty(rolestable)
	end)

	hook.Add("TTTBeginRound", "TTTBeginRoundHalos", function()
		for k,v in pairs(player.GetAll()) do
			if v:GetRole() != ROLE_TRAITOR then continue end
			table.insert(rolestable, v) 
		end
	end)
	
	hook.Add("PreDrawHalos", "AddTraitorHalos", function()
		if LocalPlayer():IsActiveTraitor() then
			halo.Add(rolestable, Color(255,50,50), 2, 2, 2, true, true)
		end
	end)
	
	net.Receive(msg_name, function()
		local ent = net.ReadEntity()
		for k,v in pairs(rolestable) do
			if v == ent then
				table.remove(rolestable, k)
			end
		end
	end)
end