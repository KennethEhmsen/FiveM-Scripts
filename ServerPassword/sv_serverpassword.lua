local passwords = {
    "Password1"
}

AddEventHandler('playerConnecting', function(name, skr, d)
    d.defer()
    Wait(50)
    d.presentCard([==[{
        "$schema": "http://adaptivecards.io/schemas/adaptive-card.json",
        "type": "AdaptiveCard",
        "version": "1.2",
        "body": [
            {
                "type": "TextBlock",
                "text":"",
                "size": "Medium",
                "weight": "Bolder"
            },
            {
                "type": "TextBlock",
                "text": "This server is protected by a password",
                "wrap": true
            },
            {
                "type": "Input.Text",
                "placeholder": "Enter password here.",
                "id": "pwd"
            }
        ],
        "actions": [
            {
                "type": "Action.Submit",
                "title": "Enter Server"
            }
        ]
    }]==],function(data, rawData)
            if table.includes(passwords, data.pwd) then 
                d.done()
            else
                d.done('Password Incorrect')
            end

        end)
end)

function table.includes(table, element)
    for _, value in pairs(table) do
      if value == element then
        return true
      end
    end
    return false
end