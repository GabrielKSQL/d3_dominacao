local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
d3ep = {}
Tunnel.bindInterface("d3_dominacao",d3ep)

-----------------------------------------------------------
-- CHECK USE
-----------------------------------------------------------
local locais = {
    -- DROGAS

    [1] = {  ['timer'] = 15 },
    [2] = {  ['timer'] = 15 },

    -- ARMAS

    [3] = {  ['timer'] = 15 },
    [4] = {  ['timer'] = 15 },
    [5] = {  ['timer'] = 15 },

    -- Muni

    [6] = {  ['timer'] = 15 },
    [7] = {  ['timer'] = 15 },
    [8] = {  ['timer'] = 15 },

    -- Lavagem

    [9] = {  ['timer'] = 15 },

    -- Desmanche
    
    [10] = {  ['timer'] = 15 },
}

function d3ep.lootear(k)
    return (locais[k].timer <= 0)
end

Citizen.CreateThread(function()
    while true do
        for k,v in pairs(locais) do
            if v.timer > 0 then
                v.timer = v.timer - 2
            end
        end
        Citizen.Wait(2000)
    end
end)

-----------------------------------------------------------
-- PERMISSAO
-----------------------------------------------------------
function d3ep.permissao(perm)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then 
        if vRP.hasPermission(user_id, perm) then
            return true
        else
            return false
        end
    end            
end    
----------------------------------------------------------------
-- PAGAMENTO
----------------------------------------------------------------
function d3ep.pagamento(perm,blip,k)

    local source = source
    local user_id = vRP.getUserId(source)
    local qtdDrogas = math.random(80,100)
    local qtdArmas = 12
    local qtdMunicao = 12
    local qtdLavagem = 40
    local qtdDesmanche = 10

    if user_id then 
        
        if perm == "drogas.permissao" and blip == 1 then
            if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("suadrogas")*qtdDrogas <= vRP.getInventoryMaxWeight(user_id) then
                locais[k].timer = 7200
                vRP.giveInventoryItem(user_id, "suadrogas", qtdDrogas)
            else
                TriggerClientEvent("Notify", source, "negado","Mochila Cheia!")
            end
        elseif perm == "drogas.permissao" and blip == 2 then
            if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("suadrogas2")*qtdDrogas <= vRP.getInventoryMaxWeight(user_id) then
                locais[k].timer = 7200
                vRP.giveInventoryItem(user_id, "suadrogas2", qtdDrogas)
            else
                TriggerClientEvent("Notify", source, "negado","Mochila Cheia!")
            end
        elseif perm == "armas.permissao" and blip == 1 then
            if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("seumaterialdeak")*qtdArmas <= vRP.getInventoryMaxWeight(user_id) then
                locais[k].timer = 7200
                vRP.giveInventoryItem(user_id, "seumaterialdeak", qtdArmas)
            else
                TriggerClientEvent("Notify", source, "negado","Mochila Cheia!")
            end
        elseif perm == "armas.permissao" and blip == 2 then
            if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("seumaterialdemp5")*qtdArmas <= vRP.getInventoryMaxWeight(user_id) then
                locais[k].timer = 7200
                vRP.giveInventoryItem(user_id, "seumaterialdemp5", qtdArmas)
            else
                TriggerClientEvent("Notify", source, "negado","Mochila Cheia!")
            end
        elseif perm == "armas.permissao" and blip == 3 then
            if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("seumaterialdetec")*qtdArmas <= vRP.getInventoryMaxWeight(user_id) then
                locais[k].timer = 7200
                vRP.giveInventoryItem(user_id, "seumaterialdetec", qtdArmas)
            else
                TriggerClientEvent("Notify", source, "negado","Mochila Cheia!")
            end                   
        elseif perm == "municao.permissao" and blip == 1 then
            if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("seumaterialdemunidetec")*qtdMunicao <= vRP.getInventoryMaxWeight(user_id) then
                locais[k].timer = 7200
                vRP.giveInventoryItem(user_id, "seumaterialdemunidetec", qtdMunicao)
            else
                TriggerClientEvent("Notify", source, "negado","Mochila Cheia!")
            end            
        elseif perm == "municao.permissao" and blip == 2 then
            if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("seumaterialdemunidemp5")*qtdMunicao <= vRP.getInventoryMaxWeight(user_id) then
                locais[k].timer = 7200
                vRP.giveInventoryItem(user_id, "seumaterialdemunidemp5", qtdMunicao)
            else
                TriggerClientEvent("Notify", source, "negado","Mochila Cheia!")
            end            
        elseif perm == "municao.permissao" and blip == 3 then
            if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("seumaterialdemunideak")*qtdMunicao <= vRP.getInventoryMaxWeight(user_id) then
                locais[k].timer = 7200
                vRP.giveInventoryItem(user_id, "seumaterialdemunideak", qtdMunicao)
            else
                TriggerClientEvent("Notify", source, "negado","Mochila Cheia!")
            end            
        elseif perm == "lavagem.permissao" and blip == 1 then
            if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("seumaterialdelavagem")*qtdLavagem <= vRP.getInventoryMaxWeight(user_id) then
                locais[k].timer = 7200
                vRP.giveInventoryItem(user_id, "seumaterialdelavagem", qtdLavagem)
            else
                TriggerClientEvent("Notify", source, "negado","Mochila Cheia!")
            end  
        elseif perm == "desmanche.permissao" and blip == 1 then
            if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("seumaterialdelock")*qtdLavagem <= vRP.getInventoryMaxWeight(user_id) then
                locais[k].timer = 7200
                vRP.giveInventoryItem(user_id, "seumaterialdelock", qtdDesmanche)
            else
                TriggerClientEvent("Notify", source, "negado","Mochila Cheia!")
            end      
        end  
    end    
end
