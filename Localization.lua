--[[ 
If you want to be super helpful, you can translate this stuff into a non-enUS language 
and I'll credit you.  Please post the translations on CurseForge at 
https://wow.curseforge.com/projects/downinfront.  Thanks!  -- Neph
--]]

local addonName, DownInFront = ...

DownInFront.Localization = {}
local Localization = DownInFront.Localization

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
	SimplifyObjectiveTracker = "Simplify objective tracker",
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

Localization["ruRU"] = {
	-- Translations by Curse user akinaw. Thanks!  
    GameWorldText = "Мир игрового мира",
    HideChatButtons = "Скрыть кнопки чата",
    HideChatButtonsTooltip = "Скрыть кнопки прокрутки в окне чата",
    HideChatTabs = "Скрыть вкладки чата",
    HideChatTabsTooltip = "Сделать вкладки чата полностью прозрачными",
    HideCombatText = "Скрыть текст боя",
    HideCombatTextTooltip = "Скрыть текст боя, например, повреждения и исцеляющие числа",
    -- HideContructionAlerts = "Скрыть оповещения о строительстве и наборе персонала",
    -- HideContructionAlertsTooltip = "Скрыть оповещения о строительстве гарнизона и оповещения о приеме в зале приема заказов",
    HideGroupLootWindow = "Скрыть окно лута группы",
    HideGroupLootWindowTooltip = "Скрыть окно, показывающее награду, полученную членами группы после убийства босса",
    HideMissionAlerts = "Скрыть предупреждения о миссии",
    HideMissionAlertsTooltip = "Скрыть предупреждения, которые заказывают миссии зала или гарнизона завершены",
    HideOrderHallBar = "Скрыть панель верхнего строения холла",
    HidePlayerTitles = "Скрыть названия игроков",
    HidePlayerGuilds = "Скрыть гильдии игроков",
    HidePlayerNameInPvE = "Скрыть имена игроков в экземплярах PvE",
    HidePlayerNameInPvETooltip = "Автоматически скрывать имена игроков в PvE-экземплярах, таких как подземелья или рейды",
    HideThreatText = "Скрыть текст угрозы",
    HideThreatTextTooltip = "Скрыть текст угрозы над такими мобами, как« Нападение на вас 'и' 'Высокая угроза'",
    ReloadAlert = "Некоторые из ваших настроек не вступят в силу, пока вы не перезагрузите пользовательский интерфейс.",
    Subtext = "Эти опции позволяют скрыть навязчивые части игрового интерфейса.",
    UserInterfaceElements = "Элементы пользовательского интерфейса"
}

--[[
Localization["deDE"] = {}
Localization["esES"] = {}
Localization["esMX"] = {}
Localization["frFR"] = {}
Localization["itIT"] = {}
Localization["koKR"] = {}
Localization["ptBR"] = {}
Localization["zhCN"] = {}
Localization["zhTW"] = {}
--]]

function DownInFront:LocalizeStrings()
	DownInFront.Strings = Localization[GetLocale()] or Localization["enUS"]
	DownInFront:SetAllTheText()
end

function DownInFront:SetAllTheText()
	local strings = self.Strings

	local panel = DownInFront.OptionsPanel
	panel.subtext:SetText(strings.Subtext)

	panel.uiElements:SetText(strings.UserInterfaceElements)
	panel.hideChatButtons.Text:SetText(strings.HideChatButtons)
	panel.hideChatButtons.tooltipText = strings.HideChatButtonsTooltip
	panel.hideChatTabs.Text:SetText(strings.HideChatTabs)
	panel.hideChatTabs.tooltipText = strings.HideChatTabsTooltip
	panel.hideGroupLoot.Text:SetText(strings.HideGroupLootWindow)
	panel.hideGroupLoot.tooltipText = strings.HideGroupLootWindowTooltip
	panel.hideMissionAlerts.Text:SetText(strings.HideMissionAlerts)
	panel.hideMissionAlerts.tooltipText = strings.HideMissionAlertsTooltip
	panel.hideOrderHallBar.Text:SetText(strings.HideOrderHallBar)
	-- panel.hideConstructionAlerts.Text:SetText(strings.HideContructionAlerts)
	-- panel.hideConstructionAlerts.tooltipText = strings.HideContructionAlertsTooltip
	panel.simplifyObjectiveTracker.Text:SetText(strings.SimplifyObjectiveTracker)

	panel.gameWorldText:SetText(strings.GameWorldText)
	panel.HidePlayerNamesInPVE.Text:SetText(strings.HidePlayerNameInPvE)
	panel.HidePlayerNamesInPVE.tooltipText = strings.HidePlayerNameInPvETooltip
	-- panel.hidePlayerTitles.Text:SetText(strings.HidePlayerTitles)
	-- panel.hidePlayerGuilds.Text:SetText(strings.HidePlayerGuilds)
	-- panel.hideCombatText.Text:SetText(strings.HideCombatText)
	-- panel.hideCombatText.tooltipText = strings.HideCombatTextTooltip
	panel.hideThreatText.Text:SetText(strings.HideThreatText)
	panel.hideThreatText.tooltipText = strings.HideThreatTextTooltip
end
