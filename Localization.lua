--[[ 
If you want to be super helpful, you can translate this stuff into a non-enUS language 
and I'll credit you.  Please post the translations on CurseForge at 
https://wow.curseforge.com/projects/downinfront.  Thanks!  -- Neph
--]]

local addonName, DownInFront = ...

DownInFront.Localization = {};
local Localization = DownInFront.Localization;

Localization["enUS"] = {
	GameWorldText = "Game-world text",
	HideChatButtons = "Hide chat buttons", 
	HideChatButtonsTooltip = "Hide scroll buttons on chat windows", 
	HideChatTabs = "Hide chat tabs",
	HideChatTabsTooltip = "Make chat tabs completely transparent", 
	HideCombatText = "Hide combat text",
	HideCombatTextTooltip = "Hide combat text like damage and healing numbers", 
	-- HideContructionAlerts = "Hide construction and recruitment alerts",
	-- HideContructionAlertsTooltip = "Hide garrison construction and order hall recruitment alerts",
	HideGroupLootWindow = "Hide group loot window",
	HideGroupLootWindowTooltip = "Hide window showing loot won by group members after a boss kill",
	HideMissionAlerts = "Hide mission alerts",
	HideMissionAlertsTooltip = "Hide alerts that order hall or garrison missions are finished", 
	HideOrderHallBar = "Hide order hall top bar", 
	HidePlayerTitles = "Hide player titles",
	HidePlayerGuilds = "Hide player guilds",
	HidePlayerNameInPvE = "Hide player names in PvE instances",
	HidePlayerNameInPvETooltip = "Automatically hide player names in PvE instances like dungeons or raids", 
	HideThreatText = "Hide threat text", 
	HideThreatTextTooltip = "Hide threat text above mobs like 'Attacking you' and 'High threat'", 
	ReloadAlert = "Some of your settings will not take effect until you reload the user interface.",
	Subtext = "These options let you hide intrusive parts of the game interface.",
	UserInterfaceElements = "User interface elements"
}

--[[
Localization["deDE"] = {}; 
Localization["esES"] = {}; 
Localization["esMX"] = {}; 
Localization["frFR"] = {}; 
Localization["itIT"] = {}; 
Localization["koKR"] = {}; 
Localization["ptBR"] = {}; 
Localization["ruRU"] = {}; 
Localization["zhCN"] = {}; 
Localization["zhTW"] = {}; 
--]]

function DownInFront:LocalizeStrings()
	DownInFront.Strings = Localization[GetLocale()] or Localization["enUS"];
	DownInFront:SetAllTheText();
end

function DownInFront:SetAllTheText()
	local strings = self.Strings;

	local optionsPanel = DownInFront.OptionsPanel;
	optionsPanel.subtext:SetText(strings.Subtext);

	optionsPanel.uiElements:SetText(strings.UserInterfaceElements);
	optionsPanel.hideChatButtons.Text:SetText(strings.HideChatButtons);
	optionsPanel.hideChatButtons.tooltipText = strings.HideChatButtonsTooltip;
	optionsPanel.hideChatTabs.Text:SetText(strings.HideChatTabs);
	optionsPanel.hideChatTabs.tooltipText = strings.HideChatTabsTooltip;
	optionsPanel.hideGroupLoot.Text:SetText(strings.HideGroupLootWindow);
	optionsPanel.hideGroupLoot.tooltipText = strings.HideGroupLootWindowTooltip;
	optionsPanel.hideMissionAlerts.Text:SetText(strings.HideMissionAlerts);
	optionsPanel.hideMissionAlerts.tooltipText = strings.HideMissionAlertsTooltip;
	optionsPanel.hideOrderHallBar.Text:SetText(strings.HideOrderHallBar);
	-- optionsPanel.hideConstructionAlerts.Text:SetText(strings.HideContructionAlerts);
	-- optionsPanel.hideConstructionAlerts.tooltipText = strings.HideContructionAlertsTooltip;

	optionsPanel.gameWorldText:SetText(strings.GameWorldText);
	optionsPanel.HidePlayerNamesInPVE.Text:SetText(strings.HidePlayerNameInPvE);
	optionsPanel.HidePlayerNamesInPVE.tooltipText = strings.HidePlayerNameInPvETooltip;
	optionsPanel.hidePlayerTitles.Text:SetText(strings.HidePlayerTitles);
	optionsPanel.hidePlayerGuilds.Text:SetText(strings.HidePlayerGuilds);
	optionsPanel.hideCombatText.Text:SetText(strings.HideCombatText);
	optionsPanel.hideCombatText.tooltipText = strings.HideCombatTextTooltip;
	optionsPanel.hideThreatText.Text:SetText(strings.HideThreatText);
	optionsPanel.hideThreatText.tooltipText = strings.HideThreatTextTooltip;
end
