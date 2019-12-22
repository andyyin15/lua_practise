local TabType = NewConst({
	MARKET  = 0,
	MYSHOP = 1,	
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


TestAuctionPanel = TestAuctionPanel or BaseClass(UIPanel)

function TestAuctionPanel:__init(index)
	self.index = index
	
	self.items = {}
	self.search_cond = {job = 0, item_type = ItemType.ALL, orderByLev = OrderType.NONE, orderByPrice = OrderType.NONE, pageNo = 1, keyword = ""}
	UIPanel.__init(self, PanelBGStyle.MIDDLE)
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
	self:SetImageDataCnfName("NewUI_AuctionPanel")
	self:SetBackGroundTitle("t01_title01")
	
	self:InitView()
end

function TestAuctionPanel:Close()
	self.items = nil
	self.marketLayer:Close()
	--self.myShopLayer:Close()
	self.marketLayer = nil
	--self.myShopLayer = nil
	Layer.Close(self)
end

function TestAuctionPanel:InitView()
	--GameLib.PrintLog("11111111"..self.items[1])

	self:AddBottomLongTex()
    self:SendSearchReq()
	
	self.marketLayer = TestAuctionMarketLayer.New(self)
	self:AddChild(self.marketLayer:GetView(), 0, 0)

end

	


function TestAuctionPanel:PanelWillAppeare()
	--self:BindHandle()
end

function TestAuctionPanel:PanelDidAppare(  )
	
end

function TestAuctionPanel:Update(interval)
	
	--self:RefreshEquipPage()
	--self.itemsPage:Update(interval)
end

TestAuctionMarketLayer = TestAuctionMarketLayer or BaseClass(Layer)

function TestAuctionMarketLayer:__init(parent)
	Layer.__init(self)
	self.parent = parent
	self:CreateUI()

	local onSearchResult1 = function(data)
		game_app:GetRunningScene():UnLockScreen()

		


		if data.data_array then
			GameLib.PrintLog("11111111111111111111")
		end
		for i,v in ipairs(data.data_array) do
			
			self.parent.items[i].itemData = v
		end

		for i,v in ipairs(self.parent.items) do
			v.node:SetVisible(false)
		end

		for i,v in ipairs(self.parent.items) do
			if data.data_array[i] then
				local proto = GGetItemData(v.itemData.entry_id)
				local iconLabel = ImageButton.Cast(v.node:GetChildByTag(ChildTagsForCell.ICON_LABEL))
				--local nameLabel = Label.Cast(v.node:GetChildByTag(ChildTagsForCell.NAME_LABEL))
				--local priceLabel = Label.Cast(v.node:GetChildByTag(ChildTagsForCell.PRICE_LABEL))
				--local numLabel = Label.Cast(v.node:GetChildByTag(ChildTagsForCell.NUM_LABEL))
				-- if(v.itemData.num>1) then
				-- 	numLabel:SetVisible(true)
				-- 	numLabel:SetString(tostring(v.itemData.num))
				-- else
				-- 	numLabel:SetVisible(false)	
				-- end

				--nameLabel:SetString(proto.name1)
				--priceLabel:SetString(v.itemData.price .. "元宝")
				iconLabel:SetNormalImage(GetItemIconImageData(proto.displayid))
				v.node:SetVisible(true)
			end
		end
		
	end
	NetWorkHandleMsg.BindMsgHandle(nil, onSearchResult1, ProtocalCode.PT_Auction_Search)

end

function TestAuctionMarketLayer:CreateUI()

	local function checkboxCallbackFunc(sender)
		local tag = sender:GetTag()
		if tag == 100 then
			self.Btn:SetNormalImage(GameConfig.ResCompose.GetImageData("NewUI_ItemDetail", "t01_bg03"))
			self.Btn:SetVisible(true)
			--self.Btn:SetPosition(-260, -100)
			--self:AddChild(self.Btn:GetView(), 0, 0)
		else

		end
	end

	local checkboxNormal = MainLayer.GetNewCommImageData("btn_no_select")
	local checkboxSelect = MainLayer.GetNewCommImageData("btn_select")

	self.Box = ControlCheckbox.New(checkboxNormal, checkboxSelect, " 价格", nil, 20)
	self.Box:SetPosition(-330, -100)
	self.Box:SetTag(100)
	self:AddChild(self.Box:GetView(), 0, 0)
	self.Box:SetCallbackFunc(checkboxCallbackFunc)

	local btnNormal  = GameConfig.ResCompose.GetImageData("NewUI_ItemDetail", "t01_bg03")
	self.Btn = ImageButton.CreateWithImageData(btnNormal)
	self.Btn:SetPosition(-260, -100)
	self.Btn:SetResponseSize(50,50)
	self:AddChild(self.Btn)
	self.Btn:SetVisible(false)


	local xpos, ypos, offset = 0, 135, 93
	for i=1,4 do
		local node = CCNode.Create()
		node:SetPosition(xpos, ypos-offset*(i-1))

		local cell_bg = Label.CreateWithImageData(GameConfig.ResCompose.GetImageData("NewUI_AuctionPanel", "t01_bg01"))
		node:AddChild(cell_bg, 0, 0) 

		local btnImageData = GameConfig.ResCompose.GetImageData("NewUI_AuctionPanel", "t01_button09")
		local buyButton = ImageButton.CreateWithImageData(btnImageData)
		buyButton:SetPosition(btnImageData.offset_x, btnImageData.offset_y)
		node:AddChild(buyButton, 0, 0)

		local onBuy = function()
			if self.parent.items[i].itemData.seller_name == game_app.role_data.role_name then
				game_app:SendGameNotify(GameConfig.NOTIFY_INFO, "不能购买自己的商品！")
				return
			end
			if self.parent.items[i].itemData.price > game_app.role_data.role_info.ingot then
				game_app:SendGameNotify(GameConfig.NOTIFY_INFO, "元宝不足，不能购买！")
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
		end
		buyButton:SetLuaTouchUp(GameLib.AddCallBackFunc(onBuy))

		btnImageData = GameConfig.ResCompose.GetImageData("NewUI_AuctionPanel", "t01_bg02")
		local texLabel = Label.CreateWithImageData(btnImageData)
		texLabel:SetPosition(btnImageData.offset_x, btnImageData.offset_y)
		node:AddChild(texLabel, 0, 0)

		local iconLabel = ImageButton.CreateWithImageData(GetItemIconImageData(10000))
		iconLabel:SetPosition(-147.5, -2.5)
		local onIconClick = function()
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
		iconLabel:SetLuaTouchUp(GameLib.AddCallBackFunc(onIconClick))
		node:AddChild(iconLabel, 0, ChildTagsForCell.ICON_LABEL)

		


		self.parent.items[i] = {}
		self.parent.items[i].node = node
		self:AddChild(node, 0, 0)
    end
end