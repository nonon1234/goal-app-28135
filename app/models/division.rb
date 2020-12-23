class Division < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '開発部１課' },
    { id: 2, name: '開発部２課' },
    { id: 3, name: 'デザイン部１課' },
    { id: 4, name: 'デザイン部２課' },
    { id: 5, name: '総務' }
  ]
end
