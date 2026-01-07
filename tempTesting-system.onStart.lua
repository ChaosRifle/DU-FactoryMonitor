--FIXME attempt to use databank to store compiled tables, so warm-boot is faster
local elementIdList = core.getElementIdList()
system.print(#elementIdList .. ' Elements detected')
local industryClassList = {}
local IndustryUnitCount = 0
local executionsPerFrame = 10 --export: number of lines to run through per-frame. more is worse performance. Above 10 for system.print is awful. for non-printing basic data gather, 500 is fine
local industry1 = true --export: t1 industry
local industry2 = true --export: t2 industry
local industry3 = true --export: t3 industry
local industry4 = true --export: t4 industry
local industry5 = true --export: t5 industry


local refiner = true --export: refiner units
local smelter = true --export: smelter units
local chemical = true --export: chemical industry units

local metalwork = true --export: metalwork component fabrication units
local electronics = true --export: electronics component fabrication units
local glasswork = true --export: glasswork component fabrication units
local printer = true --export: 3d-printer component fabrication units

local recyclers = true --export: recycling units
local honeycomb = true --export: honeycomb fabrication units

local assembler = true --export: assemblers


local industryUnit = false --export: transfer units
local itemContainer = false --export: item containers - apparently just "Container Hub"
local boardUnit = false --export: salvage bot
local generic = false --export: prog boards and blocks



local classList = {
    ['Industry1'] = industry1,
    ['Industry2'] = industry2,
    ['Industry3'] = industry3,
    ['Industry4'] = industry4,
    ['Industry5'] = industry5,
    ['IndustryUnit'] = industryUnit,
    ['ItemContainer'] = itemContainer,
    ['BoardUnit'] = boardUnit,
    ['Generic'] = generic,
}

local displayNameList = {
    ['Basic Refiner'] = refiner,
    ['Basic Smelter'] = smelter,
    ['Basic Chemical industry'] = chemical,
    ['Basic Metalwork Industry'] = metalwork,
    ['Basic Electronics industry'] = electronics,
    ['Basic Glass Furnace'] = glasswork,
    ['Basic 3D Printer'] = printer,
    ['Basic Recycler'] = recyclers,
    ['Basic Honeycomb Refinery'] = honeycomb,
    ['Basic Assembly Line'] = assembler,
    
    ['Uncommon Refiner'] = refiner,
    ['Uncommon Smelter'] = smelter,
    ['Uncommon Chemical Industry'] = chemical,
    ['Uncommon Metalwork Industry'] = metalwork,
    ['Uncommon Electronics Industry'] = electronics,
    ['Uncommon Glass Furnace'] = glasswork,
    ['Uncommon 3D Printer'] = printer,
    ['Uncommon Recycler'] = recyclers,
    ['Uncommon Honeycomb Refinery'] = honeycomb,
    ['Uncommon Assembly Line'] = assembler,
    
    ['Advanced Refiner'] = refiner,
    ['Advanced Smelter'] = smelter,
    ['Advanced Chemical Industry'] = chemical,
    ['Advanced Metalwork Industry'] = metalwork,
    ['Advanced Electronics Industry'] = electronics,
    ['Advanced Glass Furnace'] = glasswork,
    ['Advanced 3D Printer'] = printer,
    ['Advanced Recycler'] = recyclers,
    ['Advanced Honeycomb Refinery'] = honeycomb,
    ['Advanced Assembly Line'] = assembler,
    
    ['Rare Refiner'] = refiner,
    ['Rare Smelter'] = smelter,
    ['Rare Chemical Industry'] = chemical,
    ['Rare Metalwork Industry'] = metalwork,
    ['Rare Electronics Industry'] = electronics,
    ['Rare Glass Furnace'] = glasswork,
    ['Rare 3D Printer'] = printer,
    ['Rare Recycler'] = recyclers,
    ['Rare Honeycomb Refinery'] = honeycomb,
    ['Rare Assembly Line'] = assembler,
    
    ['Exotic Refiner'] = refiner,
    ['Exotic Smelter'] = smelter,
    ['Exotic Chemical Industry'] = chemical,
    ['Exotic Metalwork Industry'] = metalwork,
    ['Exotic Electronics Industry'] = electronics,
    ['Exotic Glass Furnace'] = glasswork,
    ['Exotic 3D Printer'] = printer,
    ['Exotic Recycler'] = recyclers,
    ['Exotic Honeycomb Refinery'] = honeycomb,
    ['Exotic Assembly Line'] = assembler,
    
    ['Transfer Unit'] = industryUnit,
    ['Container Hub'] = itemContainer
}




function DisplayNameDumper() --cant be local
    local x = 0
    local y = 0
    for key, value in pairs(elementIdList) do
        x=x+1
        y=y+1
        --system.print(x)
        local elementClass = core.getElementClassById(value)
        --if classList[elementClass] then
            --system.print('match found')
            local displayName = core.getElementDisplayNameById(value)
            --industryClassList[elementClass] = displayName
            if industryClassList[elementClass] then
                industryClassList[elementClass].compiledDisplayNames[displayName] = displayName
            else 
                industryClassList[elementClass] = {['compiledDisplayNames'] = {}}
                industryClassList[elementClass].compiledDisplayNames[displayName] = displayName
            end
            
            --system.print('id: ' .. value)
            --system.print('class: ' .. core.getElementClassById(value))
            --system.print('name: ' .. core.getElementNameById(value))
            --system.print('classid: ' .. core.getElementClassIdById(value))
            --system.print('itemid: ' .. core.getElementItemIdById(value))
            --core.getElementPositionById(localId)
            --system.print('displayname: ' .. core.getElementDisplayNameById(value))
            --system.print('------------------')
        --end
        if y>executionsPerFrame then
            y=0
            coroutine.yield()
       end
    end
    system.print('class list:')
    for key,value in pairs(industryClassList) do
        system.print(key .. ' :')
        for key2,value2 in pairs(value.compiledDisplayNames) do
            system.print(value2)
        end
        system.print('-----------')
        coroutine.yield()
    end
end



function FactoryMonitor() --cant be local
    local x = 0
    local y = 0
    for key, value in pairs(elementIdList) do
        x=x+1
        y=y+1
        --system.print(x)
        local elementClass = core.getElementClassById(value)
        if classList[elementClass] then
            IndustryUnitCount = IndustryUnitCount +1
            --system.print('match found')
            local displayName = core.getElementDisplayNameById(value)
            --industryClassList[elementClass] = displayName
            if industryClassList[elementClass] then
                industryClassList[elementClass].compiledDisplayNames[displayName] = displayName
            else 
                industryClassList[elementClass] = {['compiledDisplayNames'] = {}}
                industryClassList[elementClass].compiledDisplayNames[displayName] = displayName
            end
            
            --system.print('id: ' .. value)
            --system.print('class: ' .. core.getElementClassById(value))
            --system.print('name: ' .. core.getElementNameById(value))
            --system.print('classid: ' .. core.getElementClassIdById(value))
            --system.print('itemid: ' .. core.getElementItemIdById(value))
            --core.getElementPositionById(localId)
            system.print('displayname: ' .. core.getElementDisplayNameById(value))
            --system.print('------------------')
        end
        if y>executionsPerFrame then
            y=0
            coroutine.yield()
       end
    end
    system.print('class list:')
    for key,value in pairs(industryClassList) do
        system.print(key .. ' :')
        for key2,value2 in pairs(value.compiledDisplayNames) do
            system.print(value2)
        end
        coroutine.yield()
    end
    system.print(table.concat({'detected ', IndustryUnitCount, ' industry units.'}))
end

displayNameDumper = coroutine.create(DisplayNameDumper)
factoryMonitor = coroutine.create(FactoryMonitor)









local testvar = 'this is just down right dumb'

l.setRenderScript(
[[
local layer = createLayer() -- create a new layer 
local rx, ry = getResolution() -- get the resolution of the screen 
local font = loadFont("Play", 20) -- load the "Play" font at size 20 

setNextFillColor(layer, 1, 0, 0, 1) -- set the fill color (red, green, blue, alpha) for the next shape 
addBox(layer, rx/4, ry/4, rx/2, ry/2) -- add a box in the center of the screen 
addText(layer, font, ']] .. testvar .. 
[[', rx/3, ry/2) -- add a text string using font
addText(layer, font, table.concat({'render cost:', getRenderCost()/getRenderCostMax()*100, '%'}), rx/3, ry/3) -- add a text string using font
]]
)



--local fontCount = getAvailableFontCount()
--for x=1, fontCount do
--  system.print(getAvailableFontName(x))
--end

