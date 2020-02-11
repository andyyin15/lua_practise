
--保存类类型的虚表
local _class = {}
 
function BaseClass(super)
	-- 生成一个类类型,	实际上存放类信息
	local class_type = {}
	
	-- 在创建对象的时候自动调用
	--class_type.__init = false
	class_type.__delete = false
	class_type.super = super
	
	-- 创建接口
	class_type.New = function(...)
		-- 生成一个类对象
		local obj = {}
		obj._class_type = class_type

		-- 在初始化之前注册基类方法
		setmetatable(obj, { __index = _class[class_type] })

		-- 注册一个delete方法
		obj.DeleteMe = function(obj_self)
			local now_super = obj_self._class_type 
			while now_super ~= nil do	
				if now_super.__delete then
					now_super.__delete(obj_self)
				end
				now_super = now_super.super
			end
		end

		-- 调用初始化方法
		class_type.__init(obj, ...)
		
		return obj
	end

	local vtbl = {}
	_class[class_type] = vtbl
 
	setmetatable(class_type, {__newindex =
		function(t,k,v)
			vtbl[k] = v
		end
		, 
		__index = vtbl, --For call parent method
	})
 
	if super then
		setmetatable(vtbl, {__index =
			function(t,k)
				local ret = _class[super][k]
				--do not do accept, make hot update work right!
				--vtbl[k] = ret
				return ret
			end
		})
	end
 
	return class_type
end
