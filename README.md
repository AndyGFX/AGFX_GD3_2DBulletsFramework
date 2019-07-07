# Godot 3.1 - 2D Bullets Framework 

- ## Components:
    - **BF_Origin**
        - define projectile spawn point
        - properties:
            - `dispersion` - decrease pricision
            - `previewInScene` - draw pivot, direction and dispersion size in scene (in editor permanently)
        - node angle is used for base fire direction, final direction is direction +/- dispersion value
    - **BF_Emitter**
        - define emittor behaviours
        - properties:
            - `projectilePrefab` - projectile object to firing
            - `fireAtOnce` - fire from origins at same time
            - `fireDelay` - define delay between fires seperately from origin when fireAtOnce = false
        - BF_Origin must be alway as child of BF_Emitter
        - methods:
            - `Fire()` - execute shooting - once
            - `AutoFireStart(delay:float)` - repeatly firing with defined delay
            - `AutoFireStop()` - stop autofiring
    - **BF_Projectile**
        - bullet definition fro instantiate on BF_Origin from BF_Emitter
        - properties:
            - `damage` - damage value send to hit object when other object has method SetDamage(damage:float)
            - `speed` - projectile speed
            - `maxDistance` - projectile is destroyed self when value is reached
            - `lifeTime` - when is >0 then projectile is destroyed after reach used time (max distance is always checked)

- ## Hierarchy
    - [Emitter] + BF_Emitter.gd
        - [Origin1] + BF_Origin.gd
        - . . .
        - [Origin n] + BF_Origin.gd

    - [Projectile] + BF_Projectile.gd
        - [CollisionShape2D]
        - [Sprite]

- ## Screenshot (from included **Test_2DBF** demo)

![Alt text](Screenshot/Godot_v3.1.1-stable_win64_2019-07-06_18-53-15.png?raw=true "PREVIEW")
