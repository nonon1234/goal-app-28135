class Position < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '一般' },
    { id: 2, name: '管理' }
  ]
end
