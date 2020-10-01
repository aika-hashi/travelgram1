class Crowd < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '空いている' },
    { id: 3, name: '比較的空いている' },
    { id: 4, name: '比較的混雑している' },
    { id: 5, name: '混雑している' },
]
end
