local function getImageDataFromDailyGiftAndy(key)
	if(key == "")then
		return ImageDataManager.GetInstance():EmptyImageData()
	else
		return GameConfig.ResCompose.GetImageData("NewUI_DailyGift", key)
	end
end

DailyChargeAward = DailyChargeAward or BaseClass(UIPanel)

function DailyChargeAward:__init()
	UIPanel.__init(self, PanelBGStyle.MIDDLE)
	self.canGet = true
end

function DailyChargeAward:PanelDidLoad()
	self:SetImageDataCnfName("NewUI_DailyGift")
	self:SetBackGroundTitle("t01_title01")
	self:AddBottomLongTex()
	self:InitView()
	self:__initViewEvent()

	if(game_app.activityManager==nil) then
		game_app.activityManager=ActivityManager.New()
	end
	game_app.activityManager:requestRechargeAwards()
end

function DailyChargeAward:__initViewEvent()
	local onGetGiftBtnTouchUp=function()
		if self.canGet == false then
			game_app.functionManager:requestFunctionPanel(FunctionPanelId.SHOUCHONGPANEL,self.giftType+1)
			game_app.activityManager:requestRechargeAwards()
			self.canGet = true
		end
	end
	local onGetGiftBtnTouchUpId = GameLib.AddCallBackFunc(onGetGiftBtnTouchUp)
	self.getGiftBtn:SetButtonTouchCallBack(onGetGiftBtnTouchUp)
	-- local OnCharge = function (  )
	-- 	UILayerManagerEx.OpenUILayer(GameConfig.UI_RECHARGEABLE)
	-- 	--GameConfig.UI_RECHARGEABLE
	-- end
	-- self.rechargeBtn:SetButtonTouchCallBack(OnCharge)
end

function DailyChargeAward:InitView()
	local bigImage = Label.CreateWithImageFile("resource/newUI/dailyGiftBg.png")
	NodeUnity.SetScaleXFactor(bigImage, 1+ 12/bigImage:GetWidth())
 	bigImage:SetPosition(4, 65)
 	self:AddChild(bigImage, 0, 0)

 	self.image_today = Label.CreateWithImageData(getImageDataFromDailyGiftAndy("label_sct"))
 	self.image_today:SetPosition(95, 105)
 	self:AddChild(self.image_today)

 	self.image_golden = Label.CreateWithImageData(getImageDataFromDailyGiftAndy("t01_character01"))
 	NodeUnity.SetAnchorPoint(self.image_golden,0,0.5)
 	self.image_golden:SetPosition(0, 70)
 	self:AddChild(self.image_golden)

	self.yuanBaoText = Label.CreateWithImageData(getImageDataFromDailyGiftAndy("t01_character06"))
 	self.yuanBaoText:SetPosition(70,145)
 	self:AddChild(self.yuanBaoText, 0, 0)

 	self.getGiftBtn=NewButton.New()
 	self.getGiftBtn:InitBaseButton(getImageDataFromDailyGiftAndy("t01_button01"))
 	self.getGiftBtn:SetDisabledImage(getImageDataFromDailyGiftAndy("label_ds"))
 	self.getGiftBtn:GetView():SetPosition(370,-151)
 	self:AddChild(self.getGiftBtn:GetView(), 0, 0)
end

function DailyChargeAward:setYuanbao(arg)
	local numberWidth = 18
	local yuanBaoPositionX=140
	local yuanBaoPositionY=140
	if numbers[1] then
		for i=1,#numbers do
			numbers[i]=nil
		end
	end

	local numbers = {}
	local num = tostring(arg)
	for i=1,#num do
		local numSprite = string.sub(num,i,i)
		numSprite = Label.CreateWithImageData(getImageDataFromDailyGiftAndy("t01_number"..numSprite))
		numSprite:SetPosition(yuanBaoPositionX+(i-1)*numberWidth,yuanBaoPositionY)
		self:AddChild(numSprite,0,i)
		table.insert(numbers,i,numSprite)

	end
	self.yuanBaoText:SetPosition(yuanBaoPositionX+(#num-1)*numberWidth+numberWidth,145)
end

function DailyChargeAward:setDailyGiftItem(dailyGiftItem)
	if(dailyGiftItem == nil) then
		
		return 
	end
	
	self.canGet = false
	self.giftType = dailyGiftItem.type
	if(dailyGiftItem.type==0) then
		self:setYuanBao(dailyGiftItem.number)
		self.image_golden:SetImage(getImageDataFromDailygiftEx("t01_character01"))
	elseif(dailyGiftItem.type==1) then
		self:setYuanBao(dailyGiftItem.number)
		self.image_golden:SetImage(getImageDataFromDailygiftEx("t01_character03"))
	elseif(dailyGiftItem.type==2) then
		self:setYuanBao(dailyGiftItem.number)
		self.image_golden:SetImage(getImageDataFromDailygiftEx("t01_character02"))
	elseif(dailyGiftItem.type==3) then
		self:setYuanBao(dailyGiftItem.number)
		self.image_golden:SetImage(getImageDataFromDailygiftEx("t01_character04"))
	elseif(dailyGiftItem.type==4) then
		self:setYuanBao(dailyGiftItem.number)
		
		self.image_golden:SetImage(getImageDataFromDailygiftEx("t01_character05"))
	else
		self.image_golden:SetVisible(false)
		self.yuanBaoText:SetVisible(false)
		self.giftTips:SetImage(getImageDataFromDailygiftEx("label_finish"))
		self.getGiftBtn:SetIsEnabled(false)
		self.getGiftBtn:SetDisabledTextLabel(getImageDataFromDailyGiftAndy("label_dlj"))
		if numbers[1] then
		 	for i=1,#numbers do
				numbers[i]=nil
			end
		end
		--GameLib.PrintLog("今日礼包已经领取完+++++++++++")
		return
	end


	local positionX = -320
	local positionY = -153
	for i,v in ipairs(dailyGiftItem.goodsList) do
		local goodsX = positionX+(i-1)*120
		local bgSprite=ImageButton.CreateWithImageData(MainLayer.GetNewCommImageData("bg_item_02"))
		bgSprite:SetPosition(goodsX,positionY)
		self:AddChild(bgSprite, 0, 0)

		local item=GameConfig.CnfItem[v.goodsId]
		if(item~=nil and item.displayid~=nil) then
			local goodsSprite=Label.CreateWithImageData(GetItemIconImageData(item.displayid))
			goodsSprite:SetPosition(goodsX,positionY)
			self:AddChild(goodsSprite, 0, 0)		
		end
		if(v.goodsNum~=nil) then
			local goodsNumSprite=Label.CreateWithString(tostring(v.goodsNum),GlobalConfig.FontType,18)
			goodsNumSprite:SetPosition(goodsX+27,positionY-19)
			goodsNumSprite:SetColor(136,234,35)
			goodsNumSprite:SetAnchorPoint(1,0.5)
			self:AddChild(goodsNumSprite, 0, 0)
		end


		v.entry_id=v.goodsId
		v.slevel=0
		v.snum=v.goodsNum

		local onItemBtnTouchUp=function()
			-- if(item==nil) then return end
			local itemDetailPanel = ItemDetailLayer.New(v)
			itemDetailPanel:Show(bgSprite)
		end
		local onItemBtnTouchUpId = GameLib.AddCallBackFunc(onItemBtnTouchUp)
		bgSprite:SetLuaTouchUp(onItemBtnTouchUpId)
	end
end