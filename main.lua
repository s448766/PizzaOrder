-----------------------------------------------------------------------------------------
--
--
-- made by Md Faiyaz Hossain
--created in 2018-02-28
--
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------


display.setDefault( 'background', 0.4, 0.3, 1 )

-- making variables
local subtotal = nil
local toppings 

-- this is where people can read to enter amount
local instructions = display.newText( 'Enter amount of toppings between 1-4:', 540, 600, native.systemFont, 100)
instructions:setTextColor( 0.1, 0.2, 0)
instructions.id = 'instructions text'

--toppings instruction
local toppingsTextField = native.newTextField( 50, 750, 300, 110)

toppingsTextField.id = 'enter toppings'

local enterLarge = display.newImageRect( 'Button.png', 700, 400)


enterLarge.x = 550
enterLarge.y = 300

enterLarge.id = 'Large Button'
-- buttons
local enterXLarge = display.newImageRect( 'Buttona.png', 700, 400)

enterXLarge.x = 1500
enterXLarge.y = 300
enterXLarge.id = 'XLarge Button'



local function calculatePrice( event )
	-- calculates and shows the cost of the pizza
	
	local tax = subtotal * 0.13
	local total = subtotal + tax
	local showSubtotal = display.newText( 'Subtotal: $' .. string.format("%.2f", subtotal), 1500, 900, native.systemFont, 128 )
	showSubtotal:setTextColor( 1, 01, 0 )
	local showTax = display.newText( 'Tax: $' .. string.format("%.2f", tax), 1390, 1100, native.systemFont, 128 )
	showTax:setTextColor( 1, 01, 0 )
	local showTotal = display.newText( 'Total: $' .. string.format("%.2f", total), 1400, 1300, native.systemFont, 128 )
	showTotal:setTextColor( 1, 01, 0 )
end

local function onLargeClicked( event )
	--calculates subtotal if large then calls calculate price to finish and show caluculations

	toppings = tonumber( toppingsTextField.text )

	if toppings == 1 then
		subtotal = 6 + 1
		calculatePrice()
	elseif toppings == 2 then
		subtotal = 6 + 1.75
		calculatePrice()
	elseif toppings == 3 then
		subtotal = 6 + 2.5
		calculatePrice()
	elseif toppings == 4 then
		subtotal = 6 + 3.35
		calculatePrice()
	else 
		local errorText = display.newText( 'Use 1-4 only', display.contentCenterX, 1100, native.systemFont, 128 )
		errorText:setTextColor( 1, 01, 0 )
	end	
end

local function onExtraLargeClicked( event )
	--calculates subtotal if extra large then calls calculate price to finish and show caluculations
	
	toppings = tonumber( toppingsTextField.text )
	
	if toppings == 1 then
		subtotal = 10 + 1
		calculatePrice()
	elseif toppings == 2 then
		subtotal = 10 + 1.75
		calculatePrice()
	elseif toppings == 3 then
		subtotal = 10 + 2.5
		calculatePrice()
	elseif toppings == 4 then
		subtotal = 10 + 3.35
		calculatePrice()
	else 
		local errorText = display.newText( 'Use 1-4 only', display.contentCenterX, 1100, native.systemFont, 128 )
		errorText:setTextColor( 1, 01, 0 )
	end	
end

enterLarge:addEventListener( 'touch', onLargeClicked)


enterXLarge:addEventListener( 'touch', onExtraLargeClicked)