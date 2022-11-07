local addonName, DownInFront = ...

local EventFrame = CreateFrame("Frame", "DownInFrontFrame", UIParent); 


--[[ Base functions ]]--

function EventFrame:OnEvent(event, ...) 
	if event == "PLAYER_ENTERING_WORLD" then 
		DownInFront:Update()
	elseif event == "VARIABLES_LOADED" then
		DownInFront.cvarsLoaded = true;
		DownInFront:StoreNameCVars()
	elseif event == "ADDON_LOADED" then 
		local arg1 = ...
		if arg1 == addonName then
			DownInFront:OnAddonLoaded()
		elseif arg1 == "Blizzard_OrderHallUI" then
			DownInFront:HideOrderHallBar(DownInFrontOptions.HideOrderHallBar)
		end
	elseif event == "CVAR_UPDATE" then 
		DownInFront:StoreNameCVars()
	elseif event == "PLAYER_LOGOUT" then
		DownInFront:RevertNameCVars()
	end
end
EventFrame:SetScript("OnEvent", EventFrame.OnEvent)
EventFrame:RegisterEvent("VARIABLES_LOADED")
EventFrame:RegisterEvent("ADDON_LOADED")
EventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
EventFrame:RegisterEvent("CVAR_UPDATE")
EventFrame:RegisterEvent("PLAYER_LOGOUT")

function DownInFront:OnAddonLoaded()
	local reset = false
	if (DownInFrontOptions) and (DownInFrontOptions.Version) and (DownInFrontOptions.Version < "2.2") then 
		reset = true
	end
	self:UpdateOptions("DownInFrontOptions", self.Defaults, reset)
	self:LocalizeStrings()
end

function DownInFront:Update()
	local options = DownInFrontOptions

	-- UI elements
	self:HideChatButtons(options.HideChatButtons)
	self:HideChatTabs(options.HideChatTabs)

	-- Game-world text
	self:HidePlayerNamesInPVE(options.HidePlayerNamesInPVE)
	self:HidePlayerTitles(options.HidePlayerTitles)
	self:HidePlayerGuilds(options.HidePlayerGuilds)
	self:HideCombatText(options.HideCombatText)
	self:HideThreatText(options.HideThreatText)

	-- Retail-only features
	if WOW_PROJECT_ID == WOW_PROJECT_MAINLINE then  -- Blizz globals in FrameXML/Constants.lua
		self:HideGroupLoot(options.HideGroupLoot)
		self:HideMissionAlerts(options.HideMissionAlerts)
		self:HideOrderHallBar(options.HideOrderHallBar)
	end
end


--[[ Hide UI elements ]]--

function DownInFront:HideChatButtons(hideButtons)
	local chatButtons = {
		QuickJoinToastButton, -- opens social frame, FrameXML/QuickJoinToast.xml
		ChatFrameMenuButton,
		ChatFrameChannelButton, 			-- FrameXML/FloatingChatFrame.xml
		ChatFrameToggleVoiceDeafenButton, 	-- FrameXML/FloatingChatFrame.xml
		ChatFrameToggleVoiceMuteButton		-- FrameXML/FloatingChatFrame.xml
	}
	if ( hideButtons ) then 
		for key, button in pairs(chatButtons) do
			button:SetScript("OnShow", button.Hide);
			button:Hide(); 
		end
		for i=1, NUM_CHAT_WINDOWS do 
			local buttonFrame = _G["ChatFrame"..i.."ButtonFrame"];
			buttonFrame:SetScript("OnShow", buttonFrame.Hide);
			buttonFrame:Hide();
		end
	else
		for key, button in pairs(chatButtons) do
			button:SetScript("OnShow", nil);
			button:Show(); 
		end
		for i=1, NUM_CHAT_WINDOWS do 
			local buttonFrame = _G["ChatFrame"..i.."ButtonFrame"];
			buttonFrame:SetScript("OnShow", nil);
			buttonFrame:Show();
		end
	end
end

function DownInFront:HideChatTabs(hideTabs)
	-- FrameXML/FloatingChatFrame.lua
	-- FrameXML/ChatFrame.xml
	if ( hideTabs ) then 
		CHAT_FRAME_TAB_SELECTED_NOMOUSE_ALPHA = 0;
		CHAT_FRAME_TAB_ALERTING_NOMOUSE_ALPHA = 0;
		CHAT_FRAME_TAB_NORMAL_NOMOUSE_ALPHA = 0;
		for i=1, NUM_CHAT_WINDOWS do 
			_G["ChatFrame"..i.."Tab"]:SetAlpha(0);
			_G["ChatFrame"..i.."Tab"].noMouseAlpha = 0;
			-- _G["ChatFrame"..i.."EditBoxFocusLeft"]:SetAlpha(0);
			-- _G["ChatFrame"..i.."EditBoxFocusMid"]:SetAlpha(0);
			-- _G["ChatFrame"..i.."EditBoxFocusRight"]:SetAlpha(0);
			-- Commented out in Classic WoW code
			_G["ChatFrame"..i.."EditBoxLeft"]:SetAlpha(0);
			_G["ChatFrame"..i.."EditBoxMid"]:SetAlpha(0); 
			_G["ChatFrame"..i.."EditBoxRight"]:SetAlpha(0); 
			_G["ChatFrame"..i]:SetClampRectInsets(0, 0, 0, 0);
		end
	else
		-- Set back to defaults
		CHAT_FRAME_TAB_SELECTED_NOMOUSE_ALPHA = 0.4;
		CHAT_FRAME_TAB_ALERTING_NOMOUSE_ALPHA = 1;
		CHAT_FRAME_TAB_NORMAL_NOMOUSE_ALPHA = 0.2;
		for i=1, NUM_CHAT_WINDOWS do 
			_G["ChatFrame"..i.."Tab"]:SetAlpha(0.2);
			_G["ChatFrame"..i.."Tab"].noMouseAlpha = 0.2;
			-- _G["ChatFrame"..i.."EditBoxFocusLeft"]:SetAlpha(1);
			-- _G["ChatFrame"..i.."EditBoxFocusMid"]:SetAlpha(1);
			-- _G["ChatFrame"..i.."EditBoxFocusRight"]:SetAlpha(1);
			-- Commented out in Classic WoW code
			_G["ChatFrame"..i.."EditBoxLeft"]:SetAlpha(1);
			_G["ChatFrame"..i.."EditBoxMid"]:SetAlpha(1); 
			_G["ChatFrame"..i.."EditBoxRight"]:SetAlpha(1); 
			_G["ChatFrame"..i]:SetClampRectInsets(-35, 35, 26, -50);
		end
	end
end

function DownInFront:HideGroupLoot(hideLoot)
	if BossBanner then  -- Doesn't exist in Classic
		if hideLoot then 
			BossBanner:UnregisterEvent("ENCOUNTER_LOOT_RECEIVED")
		else
			BossBanner:RegisterEvent("ENCOUNTER_LOOT_RECEIVED")
		end
	end
end

function DownInFront:HideMissionAlerts(hideAlerts)
	if ( hideAlerts ) then 
		AlertFrame:UnregisterEvent("GARRISON_MISSION_FINISHED");
	else
		AlertFrame:RegisterEvent("GARRISON_MISSION_FINISHED");
	end
end

function DownInFront:HideOrderHallBar(hideBar)
	local topBar = OrderHallCommandBar;
	if ( topBar ) then  -- Only exists if Blizzard_OrderHallUI is loaded
		if ( hideBar ) then 
			topBar:Hide();
			topBar:SetScript("OnShow", topBar.Hide);
			UIParent:UnregisterEvent("UNIT_AURA");
		else
			topBar:SetScript("OnShow", OrderHallCommandBarMixin.OnShow);
			topBar:SetShown(C_Garrison.IsPlayerInGarrison(LE_GARRISON_TYPE_7_0));
			UIParent:RegisterEvent("UNIT_AURA"); 
		end
	end
end


--[[ Hide game-world text ]]--

function DownInFront:StoreNameCVars()
	if ( self.cvarsLoaded ) then 
		self.UnitNameFriendlyPlayerName = GetCVar("UnitNameFriendlyPlayerName"); 
		self.UnitNameFriendlyPetName = GetCVar("UnitNameFriendlyPetName"); 
		self.UnitNameFriendlyGuardianName = GetCVar("UnitNameFriendlyGuardianName"); 
		self.UnitNameFriendlyTotemName = GetCVar("UnitNameFriendlyTotemName"); 
		self.UnitNameOwn = GetCVar("UnitNameOwn");
	end
end

function DownInFront:HidePlayerNamesInPVE(hideNames)
	if ( hideNames ) then 
		local inInstance, instanceType = IsInInstance(); 
		if ( not inInstance ) then
			self:RevertNameCVars();
		elseif ( inInstance ) and ( instanceType ~= "pvp" ) and ( instanceType ~= "arena" ) then
			self:HidePlayerNames();
		end	
	end
end

function DownInFront:RevertNameCVars()
	if ( self.cvarsLoaded ) then 
		SetCVar("UnitNameFriendlyPlayerName", self.UnitNameFriendlyPlayerName);
		SetCVar("UnitNameFriendlyPetName", self.UnitNameFriendlyPetName);
		SetCVar("UnitNameFriendlyGuardianName", self.UnitNameFriendlyGuardianName);
		SetCVar("UnitNameFriendlyTotemName", self.UnitNameFriendlyTotemName);
		SetCVar("UnitNameOwn", self.UnitNameOwn);
	end
end

function DownInFront:HidePlayerNames()
	SetCVar("UnitNameFriendlyPlayerName", 0);
	SetCVar("UnitNameFriendlyPetName", 0);
	SetCVar("UnitNameFriendlyGuardianName", 0);
	SetCVar("UnitNameFriendlyTotemName", 0);
	SetCVar("UnitNameOwn", 0);
end

function DownInFront:HidePlayerTitles(hideTitles)
	if ( hideTitles ) then
		SetCVar("UnitNamePlayerPVPTitle", 0);
	else
		SetCVar("UnitNamePlayerPVPTitle", 1);
	end
end

function DownInFront:HidePlayerGuilds(hideGuilds)
	if ( hideGuilds ) then 
		SetCVar("UnitNameGuildTitle", 0);
		SetCVar("UnitNamePlayerGuild", 0);
	else
		SetCVar("UnitNameGuildTitle", 1);
		SetCVar("UnitNamePlayerGuild", 1);
	end
end

function DownInFront:HideCombatText(hideText)
	if ( hideText ) then 
		SetCVar("floatingCombatTextCombatHealing", 0);
		SetCVar("floatingCombatTextCombatDamage", 0);
	else
		SetCVar("floatingCombatTextCombatHealing", 1);
		SetCVar("floatingCombatTextCombatDamage", 1);
	end
end

function DownInFront:HideThreatText(hideText)
	if ( hideText ) then 
		SetCVar("threatWorldText", 0);
	else 
		SetCVar("threatWorldText", 1);
	end
end



