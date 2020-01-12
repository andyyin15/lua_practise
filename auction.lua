local CellTag = NewConst
{
	RANKING = 1, --"排名",   
	NAME    = 2, --"玩家名称"
	VAULE   = 3, --"等级",   
	JOB     = 4, --"职业",   
	GUILD   = 5, --"所在公会"
}


local TabType = NewConst({
	MARKET  = 0,
	MYSHOP = 1,
	MYSHOP1 = 2,		
})

local ItemType = NewConst({
	ALL = 0,
	EQUIP  = 1,
	NON_EQUIP  = 2,
})

local OrderType = NewConst({
	NONE = 0,
	DESC = 2,
	ASC = 1,
})

local ITEMS_PER_PAGE = 4
local SELECTOR_CELL_WIDTH = 71
local SELECTOR_CELL_HEIGHT = 35

local JobString ={
	"全职业",
	"战士",
	"法师",
	"道士",
}

local ChildTagsForCell = {
	NODE         = 1,
	ICON_LABEL   = 2,
	BUY_BUTTON   = 3,
	NAME_LABEL   = 4,
	PRICE_LABEL  = 5,
	NUM_LABEL    = 6,
}

local DefaultKeyword = "关键字"

local PAGE_ROWS = 4
local PAGE_COLS = 5
local CELL_SIZE = 71
local PAGE_SPACE = 14
local H_SPACE = 11 		--背包格子之间的横向间隔
local V_SPACE = 17		--背包格子之间的纵向间隔


local getRankPanelImgDataEx = function ( key )
	if(key == "")then
		return ImageDataManager.GetInstance():EmptyImageData()
	else
		return GameConfig.ResCompose.GetImageData("NewUI_RankingPanel", key)
	end
end

TestAuctionPanel = TestAuctionPanel or BaseClass(UIPanel)

function TestAuctionPanel:__init(index)
	self.index = index
	self.panelOneLayer = nil
	self.panelTwoLayer = nil
	self.items={}
	self.search_cond = {job = 0, item_type = ItemType.ALL, orderByLev = OrderType.NONE, orderByPrice = OrderType.NONE, pageNo = 1, keyword = ""}
	UIPanel.__init(self, PanelBGStyle.MIDDLE)
	self:SetTab(TabType.MYSHOP)
	self:TabSwitch()
end

function TestAuctionPanel:SendSearchReq()
	local protocol = ProtocalPool.GetCSPrototype(ProtocalCode.PT_Auction_Search)
	protocol.job = self.search_cond.job
	protocol.item_type = self.search_cond.item_type
	protocol.orderByLev = self.search_cond.orderByLev
	protocol.orderByPrice = self.search_cond.orderByPrice
	protocol.pageNo = self.search_cond.pageNo or 1
	
	protocol.keyword = self.search_cond.keyword
	
	ProtocalPool.SendCMD(GameConfig.Network.netid,protocol)

	game_app:GetRunningScene():LockScreen()
end

function TestAuctionPanel:PanelDidLoad()
	self:SetImageDataCnfName("NewUI_RankingPanel")
	self:SetBackGroundTitle("t01_title01")

	self:InitView()
end

function TestAuctionPanel:InitView()
	self.marketTabBtn  = self:AddTabButtonWith("t01_button02", "t01_button01", TabType.MARKET)
	self.myShopTabBtn = self:AddTabButtonWith("t01_button04", "t01_button03", TabType.MYSHOP)
	--self.marketTabBtn1  = self:AddTabButtonWith("t01_button02", "t01_button01", TabType.MYSHOP1)	

	self:SendSearchReq()

end

function TestAuctionPanel:SetTab(tab)
	--local tag = sender:GetTag()
	if tab ==  TabType.MARKET then
		if self.panelOneLayer then
			self.panelOneLayer:GetView():SetVisible(true)
			if self.panelTwoLayer then
				self.panelTwoLayer:GetView():SetVisible(false)
			else

		    end
		else
			self.panelOneLayer = TestAuctionPanelOne.New(self)
			self:AddChild(self.panelOneLayer:GetView(),0,0)
			if self.panelTwoLayer then
				self.panelTwoLayer:GetView():SetVisible(false)
			else

			end
		end
	elseif tab == TabType.MYSHOP then
		if self.panelTwoLayer then
			self.panelTwoLayer:GetView():SetVisible(true)
			if self.panelOneLayer then
				self.panelOneLayer:GetView():SetVisible(false)
			else
				
			end
		else
			self.panelTwoLayer = TestAuctionPanelTwo.New(self)
			self:AddChild(self.panelTwoLayer:GetView(),0,0)
			if self.panelOneLayer then
				self.panelOneLayer:GetView():SetVisible(false)
			else
				
			end
		end
		
	end
end


function TestAuctionPanel:TabSwitch()
	self.myShopTabBtn:SetSelected(true)
	local function tabButtonCallback(sender)
		if sender == self.marketTabBtn then
			self:SetTab(TabType.MARKET)
			self.marketTabBtn:SetSelected(true)
			self.myShopTabBtn:SetSelected(false)
		elseif sender == self.myShopTabBtn then
			self:SetTab(TabType.MYSHOP)
			self.myShopTabBtn:SetSelected(true)
			self.marketTabBtn:SetSelected(false)
		end
	end
	self.marketTabBtn:SetOnSelectedFunc(tabButtonCallback)
	self.myShopTabBtn:SetOnSelectedFunc(tabButtonCallback)
end


TestAuctionPanelOne = TestAuctionPanelOne or BaseClass(Layer)

function TestAuctionPanelOne:__init(parent)
	Layer.__init(self)
	self.parent = parent

	self.image = Label.CreateWithImageData(getRankPanelImgDataEx("t01_title01"))
	self.image:SetPosition(14, -135)
	self:AddChild(self.image, 0, 0)

	self:CreateUI()

end

function TestAuctionPanelOne:CreateUI()

	local btnImageDataNormal = self.parent:GetCommImageData("btn04_normal")

	local onBtnClickCommon = function(btnNormal)
		if btnNormal == ItemType.ALL then
			
			self.buttonAll:SetNormalImage(self.parent:GetCommImageData("btn04_select"))
			self.buttonAll:SetButtonTextColor(254, 255, 172)
			
			self.buttonEquip:SetNormalImage(btnImageDataNormal)
			self.buttonEquip:SetButtonTextColor(232, 199, 112)
			self.buttonNonEquip:SetNormalImage(btnImageDataNormal)
			self.buttonNonEquip:SetButtonTextColor(232, 199, 112)
		elseif btnNormal == ItemType.EQUIP then
			self.buttonEquip:SetNormalImage(self.parent:GetCommImageData("btn04_select"))
			self.buttonEquip:SetButtonTextColor(254, 255, 172)

			self.buttonAll:SetNormalImage(btnImageDataNormal)
			self.buttonAll:SetButtonTextColor(232, 199, 112)
			self.buttonNonEquip:SetNormalImage(btnImageDataNormal)
			self.buttonNonEquip:SetButtonTextColor(232, 199, 112)
		elseif btnNormal == ItemType.NON_EQUIP then
			self.buttonNonEquip:SetNormalImage(self.parent:GetCommImageData("btn04_select"))
			self.buttonNonEquip:SetButtonTextColor(254, 255, 172)
			
			self.buttonAll:SetNormalImage(btnImageDataNormal)
			self.buttonAll:SetButtonTextColor(232, 199, 112)
			self.buttonEquip:SetNormalImage(btnImageDataNormal)
			self.buttonEquip:SetButtonTextColor(232, 199, 112)
		else
			
		end
	end


	local function createButton(text, xpos, ypos, tag)
		local button = ImageButton.CreateWithImageData(btnImageDataNormal)

		button:SetPosition(xpos, ypos)
		button:SetButtonText(text, GlobalConfig.FontType, 20)
		button:SetDisableButtonTextColor(0xFE, 0xFF, 0xAC)
		button:SetButtonTextColor(0xE8, 0xC7, 0x70)
		
		self:AddChild(button, 0, tag or 0)

		return button
	end

	local xpos, ypos, offsetY = -298, 150.5, 78
	self.buttonAll = createButton("全    部", xpos, ypos, ItemType.ALL)
	local onBtnAllClick = function() onBtnClickCommon(ItemType.ALL) end
	self.buttonAll:SetLuaTouchUp(GameLib.AddCallBackFunc(onBtnAllClick))

	ypos = ypos - offsetY
	self.buttonEquip  = createButton("装    备", xpos, ypos, ItemType.EQUIP)
	local onBtnAllClick = function() onBtnClickCommon(ItemType.EQUIP) end
	self.buttonEquip:SetLuaTouchUp(GameLib.AddCallBackFunc(onBtnAllClick))

	ypos = ypos - offsetY
	self.buttonNonEquip  = createButton("道    具", xpos, ypos, ItemType.NON_EQUIP)
	local onBtnAllClick = function() onBtnClickCommon(ItemType.NON_EQUIP) end
	self.buttonNonEquip:SetLuaTouchUp(GameLib.AddCallBackFunc(onBtnAllClick))

	local tableBG = Scale9sprite.createWithImgCaps(self.parent:GetCommImageData("bg12"), 11, 11, 24, 16)
	tableBG:SetPreferredSize(608, 433)
	tableBG:SetPosition(94, -29)
	self:AddChild(tableBG)

	self.paiHangTitle = Label.CreateWithImageData(getRankPanelImgDataEx("t01_character06"))
	self.paiHangTitle:SetAnchorPoint(0,0)
	self.paiHangTitle:SetPosition(31, 401)
	tableBG:AddChild(self.paiHangTitle, 0, 0)

	self.nameTitle = Label.CreateWithImageData(getRankPanelImgDataEx("t01_character01"))
	self.nameTitle:SetAnchorPoint(0,0)
	self.nameTitle:SetPosition(120, 401)
	tableBG:AddChild(self.nameTitle, 0, 0)

	
	
	self.levelTitle = Label.CreateWithImageData(getRankPanelImgDataEx("t01_character09"))
	self.levelTitle:SetAnchorPoint(0,0)
	self.levelTitle:SetPosition(258, 401)
	tableBG:AddChild(self.levelTitle, 0, 0)

	self.jobTitle = Label.CreateWithImageData(getRankPanelImgDataEx("t01_character07"))
	self.jobTitle:SetAnchorPoint(0,0)
	self.jobTitle:SetPosition(345, 401)
	tableBG:AddChild(self.jobTitle, 0, 0)

	self.gonghuiTitle = Label.CreateWithImageData(getRankPanelImgDataEx("t01_character02"))
	self.gonghuiTitle:SetAnchorPoint(0,0)
	self.gonghuiTitle:SetPosition(450, 401)
	tableBG:AddChild(self.gonghuiTitle, 0, 0)

end




TestAuctionPanelTwo = TestAuctionPanelTwo or BaseClass(Layer)

function TestAuctionPanelTwo:__init(parent)
	Layer.__init(self)
	self.parent = parent

	self.image = Label.CreateWithImageData(getRankPanelImgDataEx("t01_character09"))
	self.image:SetPosition(14, -135)
	self:AddChild(self.image, 0, 0)

	self:createAuctionUI()
	local function auctionData(data)
		game_app:GetRunningScene():UnLockScreen()
		for i,v in ipairs(data.data_array) do
			self.parent.items[i].itemData = v
		end

		for i,v in ipairs(self.parent.items) do
			v.node:SetVisible(false)
		end

		for i,v in ipairs(self.parent.items) do
			if self.parent.items[i] then
				
				local proto = GGetItemData(v.itemData.entry_id)
				local iconLabel = ImageButton.Cast(v.node:GetChildByTag(ChildTagsForCell.ICON_LABEL))

				iconLabel:SetNormalImage(GetItemIconImageData(proto.displayid))
				v.node:SetVisible(true)
			end
		end

	end
	NetWorkHandleMsg.BindMsgHandle(nil, auctionData, ProtocalCode.PT_Auction_Search)

end

function TestAuctionPanelTwo:createAuctionUI()
	local xpos, ypos, offset = 0, 135, 93
	for i=1,4 do
		local node = CCNode.Create()
		local cell_bg = Label.CreateWithImageData(GameConfig.ResCompose.GetImageData("NewUI_AuctionPanel", "t01_bg01"))
		node:SetPosition(xpos, ypos-offset*(i-1))
		node:AddChild(cell_bg, 0, 0)

		local btnImageData = GameConfig.ResCompose.GetImageData("NewUI_AuctionPanel", "t01_button09")
		local buyButton = ImageButton.CreateWithImageData(btnImageData)
		buyButton:SetPosition(btnImageData.offset_x, btnImageData.offset_y)
		node:AddChild(buyButton, 0, 0)

		local function buyButtonCallBack()
			if self.parent.items[i].price > game_app.role_data.role_info.ingot then
				game_app:SendGameNotify(GameConfig.NOTIFY_INFO, "元宝不足，不能购买！")
				return
			end

			if self.parent.items[i].seller_name == game_app.role_data.role_info.name then
				game_app:SendGameNotify(GameConfig.NOTIFY_INFO, "不能购买自己的物品！")
				return
			end
			local function sendbuy()
				local protocal = ProtocalPool.GetCSPrototype(ProtocalCode.PT_Auction_Buy)
				protocal.guid = self.parent.items[i].itemData.guid
				ProtocalPool.SendCMD(GameConfig.Network.netid,protocal)
				return true
			end
			local proto = GGetItemData(self.parent.items[i].itemData.entry_id)
			local tips = string.format("是否花费 <COLOR VALUE=FFDE941B>%d元宝</COLOR> 购买 <COLOR VALUE=FFDE941B>%s</COLOR>？", self.parent.items[i].itemData.price, proto.name1)
			local messagebox = SysDlgLayer.New(tips, SysDlgLayer.Btn_OK, sendbuy, SysDlgLayer.Btn_Cancel, function() return true end)
			messagebox:Show()
		end 
		
		local buyButtonCallBack_ID = GameLib.AddCallBackFunc(buyButtonCallBack)
		buyButton:SetLuaTouchUp(buyButtonCallBack_ID)

		local iconLabel = ImageButton.CreateWithImageData(GetItemIconImageData(10000))
		iconLabel:SetPosition(-147.5, -2.5)
		node:AddChild(iconLabel, 0, ChildTagsForCell.ICON_LABEL)

		local function iconLabelClick()
			local itemDetailPanel = ItemDetailLayer.New(self.parent.items[i].itemData)
			local onBuy = function()
				if self.parent.items[i].itemData.seller_name == game_app.role_data.role_name then
					game_app:SendGameNotify(GameConfig.NOTIFY_INFO, "不能购买自己的商品！")
					itemDetailPanel:Close()
					return
				end
				if self.parent.items[i].itemData.price > game_app.role_data.role_info.ingot then
					game_app:SendGameNotify(GameConfig.NOTIFY_INFO, "元宝不足，不能购买！")
					itemDetailPanel:Close()
					return
				end
				local SendBuy = function()
					local protocol = ProtocalPool.GetCSPrototype(ProtocalCode.PT_Auction_Buy)
					protocol.guid = self.parent.items[i].itemData.guid
					ProtocalPool.SendCMD(GameConfig.Network.netid, protocol)
					return true
				end
				local proto = GGetItemData(self.parent.items[i].itemData.entry_id)
				local tips = string.format("是否花费 <COLOR VALUE=FFDE941B>%d元宝</COLOR> 购买 <COLOR VALUE=FFDE941B>%s</COLOR>？", self.parent.items[i].itemData.price, proto.name1)
				local messagebox = SysDlgLayer.New(tips, SysDlgLayer.Btn_OK, SendBuy, SysDlgLayer.Btn_Cancel, function() return true end)
				messagebox:Show()
				itemDetailPanel:Close()
			end
			itemDetailPanel:SetRightBtnCallback(ItemDetailButtonId.GOUMAI, onBuy)
			local seller = "卖家: "..self.parent.items[i].itemData.seller_name
			itemDetailPanel.mainItemDetail.auctoinSeller:SetString(seller)
			itemDetailPanel:Show(view)
		end
		local iconLabelClick_ID = GameLib.AddCallBackFunc(iconLabelClick)
		iconLabel:SetLuaTouchUp(iconLabelClick_ID)

		self.parent.items[i]={}
		self.parent.items[i].node = node
		self:AddChild(node,0,0)

	end
end

function TestAuctionPanel:__delete()
	NetWorkHandleMsg.RemoveMsgHandle(ProtocalCode.PT_Auction_Search)
	NetWorkHandleMsg.RemoveMsgHandle(ProtocalCode.PT_Auction_Buy)
end