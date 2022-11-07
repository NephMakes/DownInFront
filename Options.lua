local addonName, DownInFront = ...


--[[ Default settings ]]-- 

DownInFront.Defaults = {
	HideChatButtons = true,
	HideChatTabs = true,
	-- HideCombatText = true,
	-- HideConstructionAlerts = true,
	HideGroupLoot = true,
	HideMissionAlerts = true,
	HideOrderHallBar = true,
	HidePlayerNamesInPVE = true,
	-- HidePlayerTitles = true,
	-- HidePlayerGuilds = true,
	HideThreatText = true,
	Version = GetAddOnMetadata(addonName, "Version"),
};


--[[ Interface options panel ]]-- 

DownInFront.OptionsPanel = DownInFront:CreateOptionsPanel();
local panel = DownInFront.OptionsPanel;
panel.savedVariablesName = "DownInFrontOptions";
panel.defaults = DownInFront.Defaults;
panel.defaultsFunc = function() 
	DownInFront.options = DownInFrontOptions;
	-- DownInFront:Update()  -- Everything has a control.onValueChanged
end;
-- panel.okayFunc = function() DownInFront:Update() end;

-- Controls for UI elements

panel.uiElements = panel:CreateFontString(nil, "ARTWORK", "GameFontNormal");
panel.uiElements:SetPoint("TOPLEFT", panel.subtext, "BOTTOMLEFT", 0, -30);

panel.hideChatButtons = panel:CreateCheckButton("HideChatButtons");
panel.hideChatButtons:SetPoint("TOPLEFT", panel.uiElements, "BOTTOMLEFT", 0, -10);
panel.hideChatButtons.onValueChanged = function(hideButtons) 
	DownInFront:HideChatButtons(hideButtons);
end

panel.hideChatTabs = panel:CreateCheckButton("HideChatTabs");
panel.hideChatTabs:SetPoint("TOPLEFT", panel.hideChatButtons, "BOTTOMLEFT", 0, -6);
panel.hideChatTabs.onValueChanged = function(hideTabs) 
	DownInFront:HideChatTabs(hideTabs);
end

panel.hideGroupLoot = panel:CreateCheckButton("HideGroupLoot");
panel.hideGroupLoot:SetPoint("TOPLEFT", panel.hideChatTabs, "BOTTOMLEFT", 0, -6);
panel.hideGroupLoot.onValueChanged = function(hideLoot) 
	DownInFront:HideGroupLoot(hideLoot);
end

panel.hideMissionAlerts = panel:CreateCheckButton("HideMissionAlerts");
panel.hideMissionAlerts:SetPoint("LEFT", panel.hideChatButtons, "LEFT", 280, 0);
panel.hideMissionAlerts.onValueChanged = function(hideAlerts) 
	DownInFront:HideMissionAlerts(hideAlerts);
end

panel.hideOrderHallBar = panel:CreateCheckButton("HideOrderHallBar");
panel.hideOrderHallBar:SetPoint("TOPLEFT", panel.hideMissionAlerts, "BOTTOMLEFT", 0, -6);
panel.hideOrderHallBar.onValueChanged = function(hideBar) 
	DownInFront:HideOrderHallBar(hideBar); 
end

-- panel.hideConstructionAlerts = panel:CreateCheckButton("HideConstructionAlerts");
-- panel.hideConstructionAlerts:SetPoint("TOPLEFT", panel.hideMissionAlerts, "BOTTOMLEFT", 0, -6);


-- Controls for game-world text

panel.gameWorldText = panel:CreateFontString(nil, "ARTWORK", "GameFontNormal");
panel.gameWorldText:SetPoint("TOPLEFT", panel.hideGroupLoot, "BOTTOMLEFT", 0, -30);

panel.HidePlayerNamesInPVE = panel:CreateCheckButton("HidePlayerNamesInPVE");
panel.HidePlayerNamesInPVE:SetPoint("TOPLEFT", panel.gameWorldText, "BOTTOMLEFT", 0, -10);
panel.HidePlayerNamesInPVE.onValueChanged = function(hideNames) 
	DownInFront:HidePlayerNamesInPVE(hideNames); 
end

--[[
-- Now part of base UI

panel.hidePlayerTitles = panel:CreateCheckButton("HidePlayerTitles");
panel.hidePlayerTitles:SetPoint("TOPLEFT", panel.HidePlayerNamesInPVE, "BOTTOMLEFT", 0, -6);
panel.hidePlayerTitles.onValueChanged = function(hideTitles) 
	DownInFront:HidePlayerTitles(hideTitles);
end

panel.hidePlayerGuilds = panel:CreateCheckButton("HidePlayerGuilds");
panel.hidePlayerGuilds:SetPoint("TOPLEFT", panel.hidePlayerTitles, "BOTTOMLEFT", 0, -6);
panel.hidePlayerGuilds.onValueChanged = function(hideGuilds) 
	DownInFront:HidePlayerGuilds(hideGuilds); 
end

panel.hideCombatText = panel:CreateCheckButton("HideCombatText");
panel.hideCombatText:SetPoint("LEFT", panel.HidePlayerNamesInPVE, "LEFT", 280, 0);
panel.hideCombatText.onValueChanged = function(hideText) 
	DownInFront:HideCombatText(hideText); 
end
]]--

panel.hideThreatText = panel:CreateCheckButton("HideThreatText");
-- panel.hideThreatText:SetPoint("TOPLEFT", panel.hideCombatText, "BOTTOMLEFT", 0, -6);
panel.hideThreatText:SetPoint("LEFT", panel.HidePlayerNamesInPVE, "LEFT", 280, 0);
panel.hideThreatText.onValueChanged = function(hideText) 
	DownInFront:HideThreatText(hideText);
end


