Config = {}

-- Camera mode restored after aiming: 0 = Close | 1 = Default | 2 = Far | 3 = Cinematic
Config.DefaultCamMode = 1

-- Check interval (ms) while on foot
Config.IdleSleep = 500

-- Notification system: 'auto' | 'ox' | 'qbx' | 'qb' | 'esx' | 'native' | 'custom'
Config.Notify = 'auto'

Config.ShowHint     = true
Config.HintTitle    = 'First Person'
Config.HintText     = 'Auto-enabled while shooting from a vehicle.'
Config.HintDuration = 4000

-- Used when Config.Notify = 'custom'
Config.CustomNotify = function(title, text, duration)
    -- exports['your_notify']:Notify(title, text, duration)
end
