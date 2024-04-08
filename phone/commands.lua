addCommandHandler('p', function(thePlayer, cmd, ...)
    if thePlayer:getData('called') or thePlayer:getData('caller') then
        if (...) then
            local message = table.concat({...}, " ")
            if thePlayer:getData('call.services') then
                global:sendLocalText(thePlayer, '#D0D0D0(Telefon) '..thePlayer.name:gsub("_"," ")..': '..message, 196, 255, 255)
                thePlayer:outputChat('►#D0D0D0 İhbar gönderdiniz, lütfen sabırla bekleyin.',195,184,116,true)
                if thePlayer:getData('call.num') == 911 then
                    for _, p in ipairs(getPlayersInTeam(getTeamFromName ("Los Santos Police Department"))) do
                        p:outputChat('#6464FF►#8B8B8E (CH: 911) '..thePlayer:getData('lastPhoneId')..' telefon numarasıyla bir ihbar geldi.',0,0,0,true)
                        p:outputChat('#6464FF►#8B8B8E (CH: 911) İhbar: '..message,0,0,0,true)
                        p:outputChat('#6464FF►#8B8B8E (CH: 911) Lokasyon: '..getZoneName(thePlayer.position.x, thePlayer.position.y, thePlayer.position.z),0,0,0,true)
                        triggerClientEvent(p,"walkie.sound",p)
                    end
                    for _, p in ipairs(getPlayersInTeam(getTeamFromName ("Los Santos County Sheriff's Department"))) do
                        p:outputChat('#6464FF►#8B8B8E (CH: 911) '..thePlayer:getData('lastPhoneId')..' telefon numarasıyla bir ihbar geldi.',0,0,0,true)
                        p:outputChat('#6464FF►#8B8B8E (CH: 911) İhbar: '..message,0,0,0,true)
                        p:outputChat('#6464FF►#8B8B8E (CH: 911) Lokasyon: '..getZoneName(thePlayer.position.x, thePlayer.position.y, thePlayer.position.z),0,0,0,true)
                        triggerClientEvent(p,"walkie.sound",p)
                    end
                elseif thePlayer:getData('call.num') == 411 then
                    for _, p in ipairs(getPlayersInTeam(getTeamFromName ("Los Santos Medical Department"))) do
                        p:outputChat('#5F5F5F►#D55858 (CH: 411) '..thePlayer:getData('lastPhoneId')..' telefon numarasıyla bir ihbar geldi.',0,0,0,true)
                        p:outputChat('#5F5F5F►#D55858 (CH: 411) İhbar: '..message,0,0,0,true)
                        p:outputChat('#5F5F5F►#D55858 (CH: 411) Lokasyon: '..getZoneName(thePlayer.position.x, thePlayer.position.y, thePlayer.position.z),0,0,0,true)
                        triggerClientEvent(p,"walkie.sound",p)
                    end
                end
                thePlayer:setData('call.services', nil)
                thePlayer:setData('called', nil)
                thePlayer:setData('caller', nil)
                thePlayer:setData('call.num', nil)
                thePlayer:setData('callTarget', nil)
            else
                local targetPlayer = thePlayer:getData('callTarget') or nil
                if targetPlayer then
                    if thePlayer:getData('callWaiting') then
                        thePlayer:outputChat('►#D0D0D0 Karşı tarafın aramayı kabul etmesini bekleyin.',195,184,116,true)
                    else
                        global:sendLocalText(thePlayer, '#D0D0D0(Telefon) '..thePlayer.name:gsub("_"," ")..': '..message, 196, 255, 255)
                        targetPlayer:outputChat('#D0D0D0Telefon: '..message,195,184,116,true)
                    end
                else
                    thePlayer:outputChat('►#D0D0D0 Herhangi bir telefon görüşmesinde değilsin.',195,184,116,true)
                end
            end
        else
            thePlayer:outputChat('►#D0D0D0 /'..cmd..' Text',195,184,116,true)
        end
    end
end)