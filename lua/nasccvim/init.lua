--- The actual nasccvim module path
local local_path = debug.getinfo(1, "S").source:sub(2):match("(.*/)")

--- when local_path returned nil
if not local_path then
    error("failed to load the local module path. can't proceed...")
end

-- test it with a message
print("nasccvim module (from " .. local_path .. ") was loaded...")
