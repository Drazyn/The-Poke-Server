local OPCODE_LANGUAGE = 1
 
function onExtendedOpcode(player, opcode, buffer)
	if opcode == OPCODE_LANGUAGE then
		-- otclient language
		if buffer == 'en' or buffer == 'pt' then
			-- example, setting player language, because otclient is multi-language...
			-- player:setStorageValue(SOME_STORAGE_ID, SOME_VALUE)
		end
	else
		-- other opcodes can be ignored, and the server will just work fine...
	end
	if opcode == 123 then
			local param = buffer:split("|")
			local poke = player:getSummons()[1] or player:getSummons()
		if buffer == "evolve" then
			if not poke:getEvolution() or poke:getEvolution() == "null" then return false end
				if player:getLevel() >= poke:getMaxLevel() then
				local pokenome = poke:getName()
				local pokepos = poke:getPosition()
				poke:remove()
			local poket = Game.createMonster(poke:getEvolution(), pokepos)
			poket:setMaster(player)
			player:say("Oh!\nMeu "..pokenome.." evoluiu para "..poket:getName().."!", TALKTYPE_ORANGE_1)
		else
				player:say("Ouch!\nEu nao posso evoluir ainda!", TALKTYPE_ORANGE_1)
			end
		elseif buffer == "ride" then
			if poke:haveRide() == false or not poke:haveRide() then
				player:say("O "..pokenome.." nao possui essa habilidade!", TALKTYPE_ORANGE_1)
			return false
			end
			poke:moveTo(player:getPosition())
			player:doRide()
		elseif param[1] == "surf" then
			if poke:haveSurf() == false or not poke:haveSurf() then
				player:say("O "..pokenome.." nao possui essa habilidade!", TALKTYPE_ORANGE_1)
			return false
			end
			posSurf = {x = param[2], y = param[3], z = param[4]}
			poke:moveTo(posSurf)
			player:doSurf()
		else
		local pos = {buffer}
		pos2 = {x = param[1], y = param[2], z = param[3]}
		poke:moveTo(pos2)
		end
	end
end
