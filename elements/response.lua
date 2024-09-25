Response = {}
Response.__index = Response

function Response:create(...)
  local instance = {}
  setmetatable(instance, Response)
  if instance:constructor(...) then
    return instance
  end
  return false
end

function Response:constructor(...)
  self.enabled = false
  return true
end

function Response:isEnabled()
  return self.enabled
end

function Response:setEnabled(...)
  if arg[1] then
    self.enabled = true
  else
    self.enabled = false
  end
  return self.enabled
end

function createResponse(...)
  return Response:create(...)
end

function setResponseEnabled(...)
  return createdResponse:setEnabled(...)
end

function isResponseEnabled(...)
  return createdResponse:isEnabled()
end

createdResponse = createResponse()