io.stdout:setvbuf('no')
--love.graphics.setDefaultFilter("nearest")
if arg[#arg] == "-debug" then require("mobdebug").start() end



local touche = {}
      touche.TirP1 = "e"
      touche.TirP2 = "m" 
      touche.AllerGaucheP1 = "q"
      touche.AllerGaucheP2 = "left"
      touche.AllerDroiteP1 = "d"
      touche.AllerDroiteP2 = "right"
      touche.AllerBasP1 = "s"
      touche.AllerBasP2 = "down"
      touche.JumpP1 = "space"
      touche.JumpP2 = "up"
      touche.SwordP1 = "g"
      touche.SwordP2 = "1" -- mouse clique 1 (gauche)
      touche.Pause = "escape"
      touche.teleporte = "lshift"

fontpacifico = love.graphics.newFont("Pacifico.ttf", 30)
font = love.graphics.newFont("blocked.ttf", 18)

love.graphics.setFont(fontpacifico)

TypeEcranCourant = "menu"
local Mode = 0
local ecranCourant = "menu" ---- 1 Jeux deux joueurs / 2 Menu / 3 ....
local jumpReady = true
local Gravity = 10
local hauteurJump = 40   ----- Environ 40, à partir de 60 le hero traverse tout l'ecran !
local MoveSpeed = 300 
local hero_vx = 0
local TirSpeed = - 400
local largeur = love.graphics.getWidth()
local hauteur = love.graphics.getHeight()
local Etat = "Attente"      
local EtatAttque = false
local hero2 = {}
      hero2.x = 850
      hero2.y =  280 
      hero2.img = love.graphics.newImage("img/sprite/Knight_idle_left_01.png")
      hero2.l = hero2.img:getWidth() / 8
      hero2.h = hero2.img:getHeight() / 8
      hero2.imgCurrent = 1 
      hero2.imgCurrentTimer = 1
      hero2.direction = 0
      hero2.coldownPretTir = 1
      hero2.coldownTir = 2 


local CarteMiniJeu = love.graphics.newImage("Map/1_Porte1111.png")
  
  
  
  
local bat = {}
      bat.booger = {}
      bat.booger[1] = love.graphics.newImage("monster/Bat_Booger_1.png")
      bat.booger[2] = love.graphics.newImage("monster/Bat_Booger_2.png")
      bat.booger[3] = love.graphics.newImage("monster/Bat_Booger_3.png")
      bat.booger[4] = love.graphics.newImage("monster/Bat_Booger_4.png")
      bat.booger[5] = love.graphics.newImage("monster/Bat_Booger_5.png")
      bat.booger[6] = love.graphics.newImage("monster/Bat_Booger_6.png")
      bat.boogerDie = {}
      bat.boogerDie[1] = love.graphics.newImage("monster/Bat__Booger_FX0001.png")
      bat.boogerDie[2] = love.graphics.newImage("monster/Bat__Booger_FX0002.png")
      bat.boogerDie[3] = love.graphics.newImage("monster/Bat__Booger_FX0003.png")
      bat.boogerDie[4] = love.graphics.newImage("monster/Bat__Booger_FX0004.png")
      bat.boogerDie[5] = love.graphics.newImage("monster/Bat__Booger_FX0005.png")
      bat.boogerDie[6] = love.graphics.newImage("monster/Bat__Booger_FX0006.png")
      bat.boogerDie[7] = love.graphics.newImage("monster/Bat__Booger_FX0007.png")
      
      bat.brains = {}
      bat.brains[1] = love.graphics.newImage("monster/Bat_Brains_1.png")
      bat.brains[2] = love.graphics.newImage("monster/Bat_Brains_2.png")
      bat.brains[3] = love.graphics.newImage("monster/Bat_Brains_3.png")
      bat.brains[4] = love.graphics.newImage("monster/Bat_Brains_4.png")
      bat.brains[5] = love.graphics.newImage("monster/Bat_Brains_5.png")
      bat.brains[6] = love.graphics.newImage("monster/Bat_Brains_6.png")
      bat.brainsDie = {}
      bat.brainsDie[1] = love.graphics.newImage("monster/Bat__Brains_FX0001 .png")
      bat.brainsDie[2] = love.graphics.newImage("monster/Bat__Brains_FX0002.png")
      bat.brainsDie[3] = love.graphics.newImage("monster/Bat__Brains_FX0003.png")
      bat.brainsDie[4] = love.graphics.newImage("monster/Bat__Brains_FX0004 .png")
      bat.brainsDie[5] = love.graphics.newImage("monster/Bat__Brains_FX0005 .png")
      bat.brainsDie[6] = love.graphics.newImage("monster/Bat__Brains_FX0006 .png")
      bat.brainsDie[7] = love.graphics.newImage("monster/Bat__Brains_FX0007 .png")


      bat.purple = {}
      bat.purple[1] = love.graphics.newImage("monster/Bat_Purple_1.png")
      bat.purple[2] = love.graphics.newImage("monster/Bat_Purple_2.png")
      bat.purple[3] = love.graphics.newImage("monster/Bat_Purple_3.png")
      bat.purple[4] = love.graphics.newImage("monster/Bat_Purple_4.png")
      bat.purple[5] = love.graphics.newImage("monster/Bat_Purple_5.png")
      bat.purple[6] = love.graphics.newImage("monster/Bat_Purple_6.png")
      bat.purpleDie = {}
      bat.purpleDie[1] = love.graphics.newImage("monster/Bat__Purple_FX0001.png")
      bat.purpleDie[2] = love.graphics.newImage("monster/Bat__Purple_FX0002.png")
      bat.purpleDie[3] = love.graphics.newImage("monster/Bat__Purple_FX0003.png")
      bat.purpleDie[4] = love.graphics.newImage("monster/Bat__Purple_FX0004.png")
      bat.purpleDie[5] = love.graphics.newImage("monster/Bat__Purple_FX0005.png")
      bat.purpleDie[6] = love.graphics.newImage("monster/Bat__Purple_FX0006.png")
      bat.purpleDie[7] = love.graphics.newImage("monster/Bat__Purple_FX0007.png")
      
      bat.square = {}
      bat.square[1] = love.graphics.newImage("monster/Bat_Square_1.png")
      bat.square[2] = love.graphics.newImage("monster/Bat_Square_2.png")
      bat.square[3] = love.graphics.newImage("monster/Bat_Square_3.png")
      bat.square[4] = love.graphics.newImage("monster/Bat_Square_4.png")
      bat.square[5] = love.graphics.newImage("monster/Bat_Square_5.png")
      bat.square[6] = love.graphics.newImage("monster/Bat_Square_6.png")
      bat.squareDie = {}
      bat.squareDie[1] = love.graphics.newImage("monster/Bat__Square_FX0001.png")
      bat.squareDie[2] = love.graphics.newImage("monster/Bat__Square_FX0002.png")
      bat.squareDie[3] = love.graphics.newImage("monster/Bat__Square_FX0003.png")
      bat.squareDie[4] = love.graphics.newImage("monster/Bat__Square_FX0004.png")
      bat.squareDie[5] = love.graphics.newImage("monster/Bat__Square_FX0005.png")
      bat.squareDie[6] = love.graphics.newImage("monster/Bat__Square_FX0006.png")
      bat.squareDie[7] = love.graphics.newImage("monster/Bat__Square_FX0007.png")  
  
  
local knight = {}
      knight.lance = {}
      knight.lance.idle = {}
      knight.lance.idle[1] = love.graphics.newImage("monster/1_KNIGHT/_IDLE/_IDLE_000.png")
      knight.lance.idle[2] = love.graphics.newImage("monster/1_KNIGHT/_IDLE/_IDLE_001.png")
      knight.lance.idle[3] = love.graphics.newImage("monster/1_KNIGHT/_IDLE/_IDLE_002.png")
      knight.lance.idle[4] = love.graphics.newImage("monster/1_KNIGHT/_IDLE/_IDLE_003.png")
      knight.lance.idle[5] = love.graphics.newImage("monster/1_KNIGHT/_IDLE/_IDLE_004.png")
      knight.lance.idle[6] = love.graphics.newImage("monster/1_KNIGHT/_IDLE/_IDLE_005.png")
      knight.lance.idle[7] = love.graphics.newImage("monster/1_KNIGHT/_IDLE/_IDLE_006.png")
      
      knight.lance.attack = {}
      knight.lance.attack[1] = love.graphics.newImage("monster/1_KNIGHT/_ATTACK/ATTACK_000.png")
      knight.lance.attack[2] = love.graphics.newImage("monster/1_KNIGHT/_ATTACK/ATTACK_001.png")
      knight.lance.attack[3] = love.graphics.newImage("monster/1_KNIGHT/_ATTACK/ATTACK_002.png")
      knight.lance.attack[4] = love.graphics.newImage("monster/1_KNIGHT/_ATTACK/ATTACK_003.png")
      knight.lance.attack[5] = love.graphics.newImage("monster/1_KNIGHT/_ATTACK/ATTACK_004.png")
      knight.lance.attack[6] = love.graphics.newImage("monster/1_KNIGHT/_ATTACK/ATTACK_005.png")
      knight.lance.attack[7] = love.graphics.newImage("monster/1_KNIGHT/_ATTACK/ATTACK_006.png")
      knight.lance.attack[8] = love.graphics.newImage("monster/1_KNIGHT/_ATTACK/ATTACK_007.png")
      knight.lance.bullet = love.graphics.newImage("monster/1_KNIGHT/_ATTACK/Lance.png")
      knight.lance.die = {}
      knight.lance.die[1] = love.graphics.newImage("monster/1_KNIGHT/_DIE/_DIE_000.png")
      knight.lance.die[2] = love.graphics.newImage("monster/1_KNIGHT/_DIE/_DIE_001.png")
      knight.lance.die[3] = love.graphics.newImage("monster/1_KNIGHT/_DIE/_DIE_002.png")
      knight.lance.die[4] = love.graphics.newImage("monster/1_KNIGHT/_DIE/_DIE_003.png")
      knight.lance.die[5] = love.graphics.newImage("monster/1_KNIGHT/_DIE/_DIE_004.png")
      knight.lance.die[6] = love.graphics.newImage("monster/1_KNIGHT/_DIE/_DIE_005.png")
      knight.lance.die[7] = love.graphics.newImage("monster/1_KNIGHT/_DIE/_DIE_006.png")
      
  
      knight.lance.walk = {}
      knight.lance.walk[1] = love.graphics.newImage("monster/1_KNIGHT/_WALK/_WALK_000.png")
      knight.lance.walk[2] = love.graphics.newImage("monster/1_KNIGHT/_WALK/_WALK_001.png")
      knight.lance.walk[3] = love.graphics.newImage("monster/1_KNIGHT/_WALK/_WALK_002.png")
      knight.lance.walk[4] = love.graphics.newImage("monster/1_KNIGHT/_WALK/_WALK_003.png")
      knight.lance.walk[5] = love.graphics.newImage("monster/1_KNIGHT/_WALK/_WALK_004.png")
      knight.lance.walk[6] = love.graphics.newImage("monster/1_KNIGHT/_WALK/_WALK_005.png")
      knight.lance.walk[7] = love.graphics.newImage("monster/1_KNIGHT/_WALK/_WALK_006.png")
  
local troll = {}
      troll.green = {}
      troll.green.idle = {}
      troll.green.idle[1] = love.graphics.newImage("monster/1_TROLL/IDLE/IDLE_000.png")
      troll.green.idle[2] = love.graphics.newImage("monster/1_TROLL/IDLE/IDLE_001.png")
      troll.green.idle[3] = love.graphics.newImage("monster/1_TROLL/IDLE/IDLE_002.png")
      troll.green.idle[4] = love.graphics.newImage("monster/1_TROLL/IDLE/IDLE_003.png")
      troll.green.idle[5] = love.graphics.newImage("monster/1_TROLL/IDLE/IDLE_004.png")
      troll.green.idle[6] = love.graphics.newImage("monster/1_TROLL/IDLE/IDLE_005.png")
      troll.green.idle[7] = love.graphics.newImage("monster/1_TROLL/IDLE/IDLE_006.png")
      
      troll.green.attack = {}
      troll.green.attack[1] = love.graphics.newImage("monster/1_TROLL/ATTAK/ATTAK_000.png")
      troll.green.attack[2] = love.graphics.newImage("monster/1_TROLL/ATTAK/ATTAK_001.png")
      troll.green.attack[3] = love.graphics.newImage("monster/1_TROLL/ATTAK/ATTAK_002.png")
      troll.green.attack[4] = love.graphics.newImage("monster/1_TROLL/ATTAK/ATTAK_003.png")
      troll.green.attack[5] = love.graphics.newImage("monster/1_TROLL/ATTAK/ATTAK_004.png")
      troll.green.attack[6] = love.graphics.newImage("monster/1_TROLL/ATTAK/ATTAK_005.png")
      troll.green.attack[7] = love.graphics.newImage("monster/1_TROLL/ATTAK/ATTAK_006.png")

      troll.green.die = {}
      troll.green.die[1] = love.graphics.newImage("monster/1_TROLL/DIE/DIE_000.png")
      troll.green.die[2] = love.graphics.newImage("monster/1_TROLL/DIE/DIE_001.png")
      troll.green.die[3] = love.graphics.newImage("monster/1_TROLL/DIE/DIE_002.png")
      troll.green.die[4] = love.graphics.newImage("monster/1_TROLL/DIE/DIE_003.png")
      troll.green.die[5] = love.graphics.newImage("monster/1_TROLL/DIE/DIE_004.png")
      troll.green.die[6] = love.graphics.newImage("monster/1_TROLL/DIE/DIE_005.png")
      troll.green.die[7] = love.graphics.newImage("monster/1_TROLL/DIE/DIE_006.png")
      
  
      troll.green.walk = {}
      troll.green.walk[1] = love.graphics.newImage("monster/1_TROLL/WALK/WALK_000.png")
      troll.green.walk[2] = love.graphics.newImage("monster/1_TROLL/WALK/WALK_001.png")
      troll.green.walk[3] = love.graphics.newImage("monster/1_TROLL/WALK/WALK_002.png")
      troll.green.walk[4] = love.graphics.newImage("monster/1_TROLL/WALK/WALK_003.png")
      troll.green.walk[5] = love.graphics.newImage("monster/1_TROLL/WALK/WALK_004.png")
      troll.green.walk[6] = love.graphics.newImage("monster/1_TROLL/WALK/WALK_005.png")
      troll.green.walk[7] = love.graphics.newImage("monster/1_TROLL/WALK/WALK_006.png")
    

  
local MapCourante = CarteMiniJeu
local hero2_vx = 0
local jumpReady2 = true
      hero2.idleRight = {}  
      hero2.idleRight[1] = love.graphics.newImage("img/Hero2/SNinja_nosword_idle 1.png")
      hero2.idleRight[2] = love.graphics.newImage("img/Hero2/SNinja_nosword_idle 2.png")
      hero2.idleRight[3] = love.graphics.newImage("img/Hero2/SNinja_nosword_idle 3.png")
      hero2.idleRight[4] = love.graphics.newImage("img/Hero2/SNinja_nosword_idle 4.png")
      hero2.idleRight[5] = love.graphics.newImage("img/Hero2/SNinja_nosword_idle 5.png")
      hero2.idleRight[6] = love.graphics.newImage("img/Hero2/SNinja_nosword_idle 6.png")
      
      hero2.idleLeft ={}
      hero2.idleLeft[1] = love.graphics.newImage("img/Hero2/SNinja_nosword_idle-2 1.png")
      hero2.idleLeft[2] = love.graphics.newImage("img/Hero2/SNinja_nosword_idle-2 2.png")
      hero2.idleLeft[3] = love.graphics.newImage("img/Hero2/SNinja_nosword_idle-2 3.png")
      hero2.idleLeft[4] = love.graphics.newImage("img/Hero2/SNinja_nosword_idle-2 4.png")
      hero2.idleLeft[5] = love.graphics.newImage("img/Hero2/SNinja_nosword_idle-2 5.png")
      hero2.idleLeft[6] = love.graphics.newImage("img/Hero2/SNinja_nosword_idle-2 6.png")


      hero2.walkLeft = {}
      hero2.walkLeft[1] = love.graphics.newImage("img/Hero2/SNinja_nosword_run-2 01.png")
      hero2.walkLeft[2] = love.graphics.newImage("img/Hero2/SNinja_nosword_run-2 02.png")
      hero2.walkLeft[3] = love.graphics.newImage("img/Hero2/SNinja_nosword_run-2 03.png")
      hero2.walkLeft[4] = love.graphics.newImage("img/Hero2/SNinja_nosword_run-2 04.png")
      hero2.walkLeft[5] = love.graphics.newImage("img/Hero2/SNinja_nosword_run-2 05.png")
      hero2.walkLeft[6] = love.graphics.newImage("img/Hero2/SNinja_nosword_run-2 06.png")
      hero2.walkLeft[7] = love.graphics.newImage("img/Hero2/SNinja_nosword_run-2 07.png")
      hero2.walkLeft[8] = love.graphics.newImage("img/Hero2/SNinja_nosword_run-2 08.png")
      hero2.walkLeft[9] = love.graphics.newImage("img/Hero2/SNinja_nosword_run-2 09.png")
      hero2.walkLeft[10] = love.graphics.newImage("img/Hero2/SNinja_nosword_run-2 10.png")
      hero2.walkLeft[11] = love.graphics.newImage("img/Hero2/SNinja_nosword_run-2 11.png")
      
      hero2.walkRight = {}
      hero2.walkRight[1] =  love.graphics.newImage("img/Hero2/SNinja_nosword_run 01.png")        
      hero2.walkRight[2] =  love.graphics.newImage("img/Hero2/SNinja_nosword_run 02.png")        
      hero2.walkRight[3] =  love.graphics.newImage("img/Hero2/SNinja_nosword_run 03.png")        
      hero2.walkRight[4] =  love.graphics.newImage("img/Hero2/SNinja_nosword_run 04.png")        
      hero2.walkRight[5] =  love.graphics.newImage("img/Hero2/SNinja_nosword_run 05.png")        
      hero2.walkRight[6] =  love.graphics.newImage("img/Hero2/SNinja_nosword_run 06.png")  
      hero2.walkRight[7] =  love.graphics.newImage("img/Hero2/SNinja_nosword_run 07.png")
      hero2.walkRight[8] =  love.graphics.newImage("img/Hero2/SNinja_nosword_run 08.png")        
      hero2.walkRight[9] =  love.graphics.newImage("img/Hero2/SNinja_nosword_run 09.png")        
      hero2.walkRight[10] = love.graphics.newImage("img/Hero2/SNinja_nosword_run 10.png")        
      hero2.walkRight[11] = love.graphics.newImage("img/Hero2/SNinja_nosword_run 11.png")        


      hero2.jump = {}
      hero2.jump[1] = love.graphics.newImage("img/Hero2/SNinja_nosword_jump 1.png")
      hero2.jump[2] = love.graphics.newImage("img/Hero2/SNinja_nosword_jump 2.png")
      hero2.jump[3] = love.graphics.newImage("img/Hero2/SNinja_nosword_jump 3.png")      
      hero2.jump[4] = love.graphics.newImage("img/Hero2/SNinja_nosword_jump 1.png")
      hero2.jump[5] = love.graphics.newImage("img/Hero2/SNinja_nosword_jump 2.png")
      hero2.jump[6] = love.graphics.newImage("img/Hero2/SNinja_nosword_jump 3.png")
      
      hero2.jumpRight = {}
      hero2.jumpRight[1] = love.graphics.newImage("img/Hero2/SNinja_nosword_jump-2 1.png")
      hero2.jumpRight[2] = love.graphics.newImage("img/Hero2/SNinja_nosword_jump-2 2.png")
      hero2.jumpRight[3] = love.graphics.newImage("img/Hero2/SNinja_nosword_jump-2 3.png")      
      hero2.jumpRight[4] = love.graphics.newImage("img/Hero2/SNinja_nosword_jump-2 1.png")
      hero2.jumpRight[5] = love.graphics.newImage("img/Hero2/SNinja_nosword_jump-2 2.png")
      hero2.jumpRight[6] = love.graphics.newImage("img/Hero2/SNinja_nosword_jump-2 3.png")
      
      
      
      hero2.attackRight = {}
      hero2.attackRight[1] = love.graphics.newImage("img/sprite/Knight_attack_right_01.png")
      hero2.attackRight[2] = love.graphics.newImage("img/sprite/Knight_attack_right_02.png")
      hero2.attackRight[3] = love.graphics.newImage("img/sprite/Knight_attack_right_03.png")
      hero2.attackRight[4] = love.graphics.newImage("img/sprite/Knight_attack_right_04.png")
      hero2.attackRight[5] = love.graphics.newImage("img/sprite/Knight_attack_right_05.png")
      hero2.attackRight[6] = love.graphics.newImage("img/sprite/Knight_attack_right_06.png")
      hero2.attackRight[7] = love.graphics.newImage("img/sprite/Knight_attack_right_01.png")
      hero2.attackRight[8] = love.graphics.newImage("img/sprite/Knight_attack_right_02.png")
      hero2.attackRight[9] = love.graphics.newImage("img/sprite/Knight_attack_right_03.png")
      hero2.attackRight[10] = love.graphics.newImage("img/sprite/Knight_attack_right_04.png")
      hero2.attackRight[11] = love.graphics.newImage("img/sprite/Knight_attack_right_05.png")
      hero2.attackRight[12] = love.graphics.newImage("img/sprite/Knight_attack_right_06.png")
      
      hero2.attackLeft = {}
      hero2.attackLeft[1] = love.graphics.newImage("img/sprite/Knight_attack_left_01.png")
      hero2.attackLeft[2] = love.graphics.newImage("img/sprite/Knight_attack_left_02.png")
      hero2.attackLeft[3] = love.graphics.newImage("img/sprite/Knight_attack_left_03.png")
      hero2.attackLeft[4] = love.graphics.newImage("img/sprite/Knight_attack_left_04.png")
      hero2.attackLeft[5] = love.graphics.newImage("img/sprite/Knight_attack_left_05.png")
      hero2.attackLeft[6] = love.graphics.newImage("img/sprite/Knight_attack_left_06.png")
      hero2.attackLeft[7] = love.graphics.newImage("img/sprite/Knight_attack_left_01.png")
      hero2.attackLeft[8] = love.graphics.newImage("img/sprite/Knight_attack_left_02.png")
      hero2.attackLeft[9] = love.graphics.newImage("img/sprite/Knight_attack_left_03.png")
      hero2.attackLeft[10] = love.graphics.newImage("img/sprite/Knight_attack_left_04.png")
      hero2.attackLeft[11] = love.graphics.newImage("img/sprite/Knight_attack_left_05.png")
      hero2.attackLeft[12] = love.graphics.newImage("img/sprite/Knight_attack_left_06.png")
      
      
      
local hero = {}
      hero.x = largeur/2
      hero.y =  280 
      hero.img = love.graphics.newImage("img/sprite/Knight_idle_left_01.png")
      hero.l = hero.img:getWidth() / 8
      hero.h = hero.img:getHeight() / 8
      hero.imgCurrent = 1 
      hero.idleLeft = {}
      hero.imgCurrentTimer = 1
      hero.coldownPretTir = 1
      hero.coldownTir = 2
      hero.friction = 0
      hero.attaqFrame = 1
      hero.attaqTimer = 1
      hero.attaq = false
      
      
      hero.direction = 1
      hero.idleLeft[1] = love.graphics.newImage("img/sprite/Knight_idle_left_01.png")
      hero.idleLeft[2] = love.graphics.newImage("img/sprite/Knight_idle_left_02.png")
      hero.idleLeft[3] = love.graphics.newImage("img/sprite/Knight_idle_left_03.png")
      hero.idleLeft[4] = love.graphics.newImage("img/sprite/Knight_idle_left_04.png")
      hero.idleLeft[5] = love.graphics.newImage("img/sprite/Knight_idle_left_05.png")
      hero.idleLeft[6] = love.graphics.newImage("img/sprite/Knight_idle_left_05.png")
      
      hero.idleRight ={}
      hero.idleRight[1] = love.graphics.newImage("img/sprite/Knight_idle_right_01.png")
      hero.idleRight[2] = love.graphics.newImage("img/sprite/Knight_idle_right_02.png")
      hero.idleRight[3] = love.graphics.newImage("img/sprite/Knight_idle_right_03.png")
      hero.idleRight[4] = love.graphics.newImage("img/sprite/Knight_idle_right_04.png")
      hero.idleRight[5] = love.graphics.newImage("img/sprite/Knight_idle_right_05.png")
      hero.idleRight[6] = love.graphics.newImage("img/sprite/Knight_idle_right_05.png")


      hero.walkRight = {}
      hero.walkRight[1] = love.graphics.newImage("img/sprite/Knight_walk_right_01.png")
      hero.walkRight[2] = love.graphics.newImage("img/sprite/Knight_walk_right_02.png")
      hero.walkRight[3] = love.graphics.newImage("img/sprite/Knight_walk_right_03.png")
      hero.walkRight[4] = love.graphics.newImage("img/sprite/Knight_walk_right_04.png")
      hero.walkRight[5] = love.graphics.newImage("img/sprite/Knight_walk_right_05.png")
      hero.walkRight[6] = love.graphics.newImage("img/sprite/Knight_walk_right_06.png")
      
      hero.walkLeft = {}
      hero.walkLeft[1] = love.graphics.newImage("img/sprite/Knight_walk_left_01.png")        
      hero.walkLeft[2] = love.graphics.newImage("img/sprite/Knight_walk_left_02.png")        
      hero.walkLeft[3] = love.graphics.newImage("img/sprite/Knight_walk_left_03.png")        
      hero.walkLeft[4] = love.graphics.newImage("img/sprite/Knight_walk_left_04.png")        
      hero.walkLeft[5] = love.graphics.newImage("img/sprite/Knight_walk_left_05.png")        
      hero.walkLeft[6] = love.graphics.newImage("img/sprite/Knight_walk_left_06.png")        

      hero.jump = {}
      hero.jump[1] = love.graphics.newImage("img/sprite/Knight_jump_01.png")
      hero.jump[2] = love.graphics.newImage("img/sprite/Knight_jump_02.png")
      hero.jump[3] = love.graphics.newImage("img/sprite/Knight_jump_01.png")
      hero.jump[4] = love.graphics.newImage("img/sprite/Knight_jump_02.png")
      hero.jump[5] = love.graphics.newImage("img/sprite/Knight_jump_01.png")
      hero.jump[6] = love.graphics.newImage("img/sprite/Knight_jump_02.png")
      
      hero.attackRight = {}
      hero.attackRight[1] = love.graphics.newImage("img/sprite/Knight_attack_right_01.png")
      hero.attackRight[2] = love.graphics.newImage("img/sprite/Knight_attack_right_02.png")
      hero.attackRight[3] = love.graphics.newImage("img/sprite/Knight_attack_right_03.png")
      hero.attackRight[4] = love.graphics.newImage("img/sprite/Knight_attack_right_04.png")
      hero.attackRight[5] = love.graphics.newImage("img/sprite/Knight_attack_right_05.png")
      hero.attackRight[6] = love.graphics.newImage("img/sprite/Knight_attack_right_06.png")
      hero.attackRight[7] = love.graphics.newImage("img/sprite/Knight_attack_right_01.png")
      hero.attackRight[8] = love.graphics.newImage("img/sprite/Knight_attack_right_02.png")
      hero.attackRight[9] = love.graphics.newImage("img/sprite/Knight_attack_right_03.png")
      hero.attackRight[10] = love.graphics.newImage("img/sprite/Knight_attack_right_04.png")
      hero.attackRight[11] = love.graphics.newImage("img/sprite/Knight_attack_right_05.png")
      hero.attackRight[12] = love.graphics.newImage("img/sprite/Knight_attack_right_06.png")
      
      hero.attackLeft = {}
      hero.attackLeft[1] = love.graphics.newImage("img/sprite/Knight_attack_left_01.png")
      hero.attackLeft[2] = love.graphics.newImage("img/sprite/Knight_attack_left_02.png")
      hero.attackLeft[3] = love.graphics.newImage("img/sprite/Knight_attack_left_03.png")
      hero.attackLeft[4] = love.graphics.newImage("img/sprite/Knight_attack_left_04.png")
      hero.attackLeft[5] = love.graphics.newImage("img/sprite/Knight_attack_left_05.png")
      hero.attackLeft[6] = love.graphics.newImage("img/sprite/Knight_attack_left_06.png")
      hero.attackLeft[7] = love.graphics.newImage("img/sprite/Knight_attack_left_01.png")
      hero.attackLeft[8] = love.graphics.newImage("img/sprite/Knight_attack_left_02.png")
      hero.attackLeft[9] = love.graphics.newImage("img/sprite/Knight_attack_left_03.png")
      hero.attackLeft[10] = love.graphics.newImage("img/sprite/Knight_attack_left_04.png")
      hero.attackLeft[11] = love.graphics.newImage("img/sprite/Knight_attack_left_05.png")
      hero.attackLeft[12] = love.graphics.newImage("img/sprite/Knight_attack_left_06.png")
            
      hero.tpFrame = 1
      hero.tpTimer = 1
      hero.move = true
      
      hero.teleportationLeft = {}
      hero.teleportationLeft[1] = love.graphics.newImage("img/sprite/Knight_die_left_01.png")
      hero.teleportationLeft[2] = love.graphics.newImage("img/sprite/Knight_die_left_02.png")
      hero.teleportationLeft[3] = love.graphics.newImage("img/sprite/Knight_die_left_03.png")
      hero.teleportationLeft[4] = love.graphics.newImage("img/sprite/Knight_die_left_04.png")
      hero.teleportationLeft[5] = love.graphics.newImage("img/sprite/Knight_die_left_05.png")
      hero.teleportationLeft[6] = love.graphics.newImage("img/sprite/Knight_die_left_06.png")
      hero.teleportationLeft[7] = love.graphics.newImage("img/sprite/Knight_die_left_07.png")
      hero.teleportationLeft[8] = love.graphics.newImage("img/sprite/Knight_die_left_08.png")

      hero.teleportationRight = {}
      hero.teleportationRight[1] = love.graphics.newImage("img/sprite/Knight_die_right_01.png")
      hero.teleportationRight[2] = love.graphics.newImage("img/sprite/Knight_die_right_02.png")
      hero.teleportationRight[3] = love.graphics.newImage("img/sprite/Knight_die_right_03.png")
      hero.teleportationRight[4] = love.graphics.newImage("img/sprite/Knight_die_right_04.png")
      hero.teleportationRight[5] = love.graphics.newImage("img/sprite/Knight_die_right_05.png")
      hero.teleportationRight[6] = love.graphics.newImage("img/sprite/Knight_die_right_06.png")
      hero.teleportationRight[7] = love.graphics.newImage("img/sprite/Knight_die_right_07.png")
      hero.teleportationRight[8] = love.graphics.newImage("img/sprite/Knight_die_right_08.png")
      hero.disparition = false   ------ Phase de disparition du hero
      hero.aparition = false  ------ Phase d'aparition du hero
      hero.tp = false   ------ teleportation du hero
local cameraX = -1000
local cameraY = 0            


            
local liste_tirs = {}
local imgBackGround = love.graphics.newImage("img/BackGround.png")



    
    
    
    -------------Map 1 -----------------
local map = {}
      map[1]  = { 1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1 }    
      map[2]  = { 1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1 }
      map[3]  = { 1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1 }
      map[4]  = { 1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1 }  
      map[5]  = { 1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1 }    
      map[6]  = { 1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1 }
      map[7]  = { 1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1 }    
      map[8]  = { 1,1,2,0,0,0,0,0,0,0,0,0,0,0,2,2,2,2,2,2,2,0,0,0,0,2,2,1,1,1 }
      map[9]  = { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 }    
      map[10] = { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 }
      map[11] = { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 }    
      map[12] = { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 }
      map[13] = { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 }
      map[14] = { 0,0,0,0,0,0,0,2,2,2,2,2,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 }
      map[15] = { 1,1,1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1 }    
      map[16] = { 1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1 }
      map[17] = { 1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1 }    
      map[18] = { 1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1 }   
      map[19] = { 1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1 }    
      map[20] = { 1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1 }    
      map[21] = { 1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1 }  
 
 
 

local CarteAvanture = {}
      CarteAvanture.n1 = {}
      
CarteAvanture.n1[1]={1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}
CarteAvanture.n1[2]={1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}
CarteAvanture.n1[3]={1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,12,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}
CarteAvanture.n1[4]={1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1}
CarteAvanture.n1[5]={1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1}
CarteAvanture.n1[6]={1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1}
CarteAvanture.n1[7]={1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1}
CarteAvanture.n1[8]={1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,2,2,2,2,2,2,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1}
CarteAvanture.n1[9]={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1}
CarteAvanture.n1[10]={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,2,2,2,2,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,2,2,2,2,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
CarteAvanture.n1[11]={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,2,2,2,2,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,2,2,2,2,2,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,2,2,2,2,2,2,0,0,0,0,0,0,0,0,0}
CarteAvanture.n1[12]={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,2,2,2,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
CarteAvanture.n1[13]={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,2,2,2,2,2,2,0,0,0,0,2,2,2,2,2,2,2,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,2,2,2,2,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
CarteAvanture.n1[14]={1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
CarteAvanture.n1[15]={1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,2,2,2,2,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,0,0,0,2,2,2,2,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1}
CarteAvanture.n1[16]={1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1}
CarteAvanture.n1[17]={1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1}
CarteAvanture.n1[18]={1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1}
CarteAvanture.n1[19]={1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1}
CarteAvanture.n1[20]={1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}
CarteAvanture.n1[21]={1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}
 

local imgAvanture = {}
      imgAvanture[1] = love.graphics.newImage("Map/mapAvanture.png")
local salleCourante = CarteAvanture.n1


local scale = {}
local SndMenu
local msc = true
----Load --------------
function love.load()  
  love.window.setTitle("HelsingWall")
  --love.window.setFullscreen(true)
  love.window.setMode(900,640)
   
   scale.x = love.graphics.getWidth()
   scale.y = love.graphics.getHeight()
  
  SndMenu = love.audio.newSource("soundMenu.mp3",static)
  SndPlay = love.audio.newSource("sound.mp3",static)
  SndMenu:setLooping(true)
  love.audio.setVolume(50)
  love.audio.play(SndMenu)
   
   
   
  creeSprite("knight",1,300,300)
  creeSprite("bat",1,350,300)
  creeSprite("knight",1,400,300)
  creeSprite("troll",1,500,300)
  creeSprite("knight",1,700,300)
  creeSprite("troll",1,600,300)
  creeSprite("knight",1,1500,300)
  creeSprite("knight",1,1500,300)
  creeSprite("knight",1,4500,300)
  creeSprite("bat",1,2000,300)
  creeSprite("knight",1,2555,300)
  creeSprite("knight",1,2700,300)
  creeSprite("bat",1,1900,300)
  creeSprite("knight",1,4000,300)
  creeSprite("knight",1,7000,300)
  creeSprite("knight",1,5800,300)
  creeSprite("bat",1,6700,300)
  creeSprite("knight",1,7500,300)
  creeSprite("knight",1,7800,300)
  creeSprite("troll",1,2245,300)
  creeSprite("troll",1,3452,300)
  creeSprite("troll",1,2457,300)
  creeSprite("troll",1,2678,300)
  creeSprite("troll",1,4682,300)
  creeSprite("troll",1,5820,300)
  creeSprite("troll",1,6204,300)
  creeSprite("troll",1,6907,300)
  creeSprite("troll",1,7640,300)
  


end
function love.update(dt)
    
  
  
  
  if ecranCourant == "jeu" then 
    joueur1_Update(dt)
    joueur2_Update(dt)
    TraitementDesTirs(dt)
    fGameOver()
    TypeEcranCourant = "jeu"
  elseif ecranCourant == "playerVsIA" then
    joueur1_Update(dt)
    JoueurIA_Update(dt) 
    TraitementDesTirs(dt)
    fGameOver()
    TypeEcranCourant = "jeu"
  elseif ecranCourant == "knifeGame" then 
    knifeGameLevel()
    knifeGameSprite_Update(dt) 
    TraitementDesTirsKnifeGame(dt)
    TraitementDesCibles(dt)
    GererLesCibles()
    TypeEcranCourant = "jeu"
    
  elseif ecranCourant == "avanture" then
    avantureUpdate(dt)
    TypeEcranCourant = "jeu"
  elseif ecranCourant == "jeu"        then TypeEcranCourant = "menu" 
  elseif ecranCourant == "menu "      then TypeEcranCourant = "menu" 
  elseif ecranCourant == "touches"    then TypeEcranCourant = "menu" 
  elseif ecranCourant == "option"     then TypeEcranCourant = "menu" 
  elseif ecranCourant == "difficulty" then TypeEcranCourant = "menu" 
  elseif ecranCourant == "GameOver"   then TypeEcranCourant = "menu" 
  elseif ecranCourant == "games"      then TypeEcranCourant = "menu" 

end

  if TypeEcranCourant == "menu" then
    Updateparticle()
    TraitementDesparticles(dt)
    love.audio.setVolume(2)
    love.audio.play(SndMenu)
    SndMenu:setLooping(true)
    love.audio.stop(SndPlay)
  elseif TypeEcranCourant == "jeu"then
    love.audio.play(SndPlay)
    SndMenu:setLooping(true)
    love.audio.stop(SndMenu)
  end
  
end
 


function love.draw()
  
 -- love.graphics.scale(scale.x / 900  ,  scale.y / 640) ---Pour le full screen
    love.graphics.setBackgroundColor( 30, 23, 37)
    
    
  
  if TypeEcranCourant == "menu" then
    drawparticle()
    
  
  end
  if ecranCourant == "jeu" then
    drawMap()
    drawLifeBar()
    drawSpriteMvt()
    drawSprite2Mvt()
    drawTirKnife()
    drawTimerKnife()

  elseif ecranCourant == "playerVsIA" then
    drawMap()
    drawLifeBar()
    drawSpriteMvt()
    drawIA_mvt()
    drawTirKnife()
    drawTimerKnife()
  elseif ecranCourant == "knifeGame" then
    drawmapKnifeGame()
    drawTarget()  
    DrawTargetLife()
    drawTirKnife()
    drawSpriteMvt()
    drawJauge()
  elseif ecranCourant == "avanture" then

    drawparticle()
    love.graphics.print("A venir",largeur/2,hauteur/2)
    drawCarteAvanture()
    drawSpriteMvt()
    drawTirKnifeAventure()
    drawSprite()
    drawDead()
  elseif ecranCourant == "menu" then
    drawMenu()
  elseif ecranCourant == "option" then
    drawOption()  
  elseif ecranCourant == "difficulty" then 
    drawDifficulty()
  elseif ecranCourant == "GameOver" then 
    drawGameOver()
  elseif ecranCourant == "touche" then 
    drawTouches()
  elseif ecranCourant == "games" then
    draw_Jeu()
  end
    
end


function love.keypressed(key)
  
  if ecranCourant == "jeu" then
    jeuKeyPressed(key)
    
  elseif ecranCourant == "avanture" then
  if key == "r" then
     creeSprite("knight",1,300,300)
  creeSprite("bat",1,350,300)
  creeSprite("knight",1,400,300)
  creeSprite("troll",1,500,300)
  creeSprite("knight",1,700,300)
  creeSprite("troll",1,600,300)
  creeSprite("knight",1,1500,300)
  creeSprite("knight",1,1500,300)
  creeSprite("knight",1,4500,300)
  creeSprite("bat",1,2000,300)
  creeSprite("knight",1,2555,300)
  creeSprite("knight",1,2700,300)
  creeSprite("bat",1,1900,300)
  creeSprite("knight",1,4000,300)
  creeSprite("knight",1,7000,300)
  creeSprite("knight",1,5800,300)
  creeSprite("bat",1,6700,300)
  creeSprite("knight",1,7500,300)
  creeSprite("knight",1,7800,300)
  creeSprite("troll",1,2245,300)
  creeSprite("troll",1,3452,300)
  creeSprite("troll",1,2457,300)
  creeSprite("troll",1,2678,300)
  creeSprite("troll",1,4682,300)
  creeSprite("troll",1,5820,300)
  creeSprite("troll",1,6204,300)
  creeSprite("troll",1,6907,300)
  creeSprite("troll",1,7640,300)
  end
    
    jeuKeyPressed(key)
  elseif ecranCourant == "menu" then
    if key == touche.Pause then
      if Mode == 1 then
        ecranCourant = "jeu"  
      elseif Mode == 2 then
        ecranCourant = "playerVsIA"
      elseif Mode == 3 then
        ecranCourant = "avanture"
      end
    end    
    MenuKeyPressed(key) 
  elseif ecranCourant == "option" then
    OptionKeyPressed(key)  
  elseif ecranCourant == "difficulty" then
    DifficultyKeyPressed(key) 
  elseif ecranCourant == "GameOver" then
    GameOverKeyPressed(key) 
  elseif ecranCourant == "touche" then
    TouchesKeyPressed(key)   
  elseif ecranCourant == "games" then
      _JeuKeyPressed(key)
  elseif ecranCourant == "knifeGame" then
    knifeGameKeyPressed(key)
    if key == touche.JumpP1 then
      if jumpReady then
        hero_vx = hauteurJump
      end
    end
  elseif ecranCourant == "playerVsIA" then
    if key == touche.Pause then
      ecranCourant = "menu"     
    end
    if key == touche.JumpP1 then
      if jumpReady then
        hero_vx = hauteurJump
      end
      
    end
  end  
end


function math.angle(x1,y1, x2,y2) return math.atan2(y2-y1, x2-x1) end
function math.dist(x1,y1, x2,y2) return ((x2-x1)^2+(y2-y1)^2)^0.5 end
function colide(pX1,pY1,pL1,pH1,pX2,pY2,pL2,pH2)
local a = {}  
      a.x = pX1
      a.y = pY1
      a.l = pL1
      a.h = pH1

local b = {}
      b.x = pX2 
      b.y = pY2 
      b.l = pL2 
      b.h = pH2
  if a.x < b.x + b.h  then  --/// -25 car l'image est trop grande en . png 
    if a.x + a.h > b.x  then --/// -25 car l'image est trop grande en . png 
      if a.y + a.l> b.y  then
        if a.y < b.y + b.l  then
          return true
        end
      end
    end
  end
end
--






function jeuKeyPressed(key)
    if key == touche.Pause  then
      ecranCourant = "menu"     
  end
  
  if key == touche.SwordP1 then
    hero.attaq = true
  end
  
  if key == touche.teleporte then
    if hero.disparition == false and hero.aparition == false and hero.tp == false then ----- si tout est remis a zero
      hero.disparition = true
      hero.move = false
    end
  end
  
    if key == touche.JumpP1 then
      if jumpReady then
        if hero.move == true then
          hero_vx = hauteurJump
        end
      end
    end
    
    if key == touche.JumpP2 then
      if jumpReady2 then
        hero2_vx = hauteurJump
      end    
    end    
end


function creeAttaque(dt)
   hero.attaqFrame = math.floor(hero.attaqTimer)
  if hero.attaq == true then
      hero.attaqTimer = hero.attaqTimer + 20 * dt
    end  
    if hero.attaqTimer > 6.9 then
      
      hero.attaqTimer = 1 
      hero.attaq = false
      
  end
  
end

function DegatsEpe()
  if hero.attaq == true then
    if hero.direction == 1 then
      
      if colide(hero.x+75,hero.y,hero.h,hero.l-75
        
        ,hero2.x,hero2.y,hero2.h,hero2.l) then
         lifeBar.LifeRestant2 = lifeBar.LifeRestant2 - 3
      end
    else
      if colide(hero.x,hero.y,hero.h,hero.l-50,hero2.x,hero2.y,hero2.h,hero2.l) then 
        lifeBar.LifeRestant2 = lifeBar.LifeRestant2 - 3
      end
    end
  end
end

function Teleportation(dt)
   hero.tpFrame = math.floor(hero.tpTimer)
  if hero.disparition == true then
    if hero.direction == 0 then
      if Colide_TpLeft(map) == true then
      
          hero.tpTimer = hero.tpTimer + 25 * dt  
      else
        hero.disparition = false 
        hero.move = true
      end
    else
      if Colide_TpRight(map) == true then
          hero.tpTimer = hero.tpTimer + 25 * dt  
      else
        hero.disparition = false 
        hero.move = true
      end
    end
  end  
  
  if hero.tpTimer > 9 then   ---- Change la frame du hero
      hero.tpTimer = 1 
      hero.disparition = false
      hero.aparition = true   ---- initialise les autres phases
      hero.tp = true
  end
  
  
  if hero.tp == true then
    if hero.direction == 1 then   ---- Teleportation 
      hero.x = hero.x + 3*32     
    else
      hero.x = hero.x - 3*32
    end
    hero.tp = false
    hero.tpTimer = 9 
  end
  
  
  if hero.aparition == true then
    hero.tpTimer = hero.tpTimer - 25 * dt
  end
  if hero.tpTimer < 1 then
      hero.tpTimer = 1 
      hero.disparition = false
      hero.aparition = false  ------- Réinitialisation 
      hero.tp = false
      hero.move = true
  end
  
end
---Functions pour gerer tout les tirs et la colision ! ------------
---Functions pour gerer tout les tirs et la colision ! ------------

 
function CreeTir(pNomImage, pX, pY,Pdirection,pType)
local tir = {}
  tir = {}
  tir.x = pX
  tir.y = pY
  tir.direction = Pdirection
  tir.type = pType
  tir.supprime = false
  tir.speed = 0
  if tir.type == 3 then
    tir.image = love.graphics.newImage("monster/1_KNIGHT/_ATTACK/Lance.png")
      if tir.direction == 0 then 
        tir.speed = 400
      else
        tir.speed = -400
      end
  else
    tir.image = love.graphics.newImage("img/"..pNomImage..".png")
      if tir.direction == 1 then 
        tir.speed = 800
      else
        tir.speed = -800
      end
  end
  tir.l = tir.image:getWidth()
  tir.h = tir.image:getHeight()
  
  table.insert(liste_tirs, tir)
    
end



function coldownTir(dt)
      hero.coldownPretTir = hero.coldownPretTir + hero.coldownTir * dt
      hero2.coldownPretTir = hero2.coldownPretTir + hero2.coldownTir * dt  
      if hero.coldownPretTir  > 1 then hero.coldownPretTir = 1.0001 end --- 1.0001 (pour etre supérieur a 1 pas visible
      if hero2.coldownPretTir > 1 then hero2.coldownPretTir = 1.0001 end
end
function TraitementDesTirs(dt)
   
  if ecranCourant ~= "avanture" then
   UpdateTir()
   coldownTir(dt)

    
   local n

  

  -- traitement des tirs
  for n=#liste_tirs,1,-1 do
    local tir = liste_tirs[n]
    tir.x = tir.x + tir.speed * dt
  
      ---------Colision joueur Tir !!!-------------------
  if tir.type == 2 then
    if colide(tir.x,tir.y,tir.l,tir.h,hero.x,hero.y,hero.l,hero.h) == true  then 
        tir.supprime = true
        table.remove(liste_tirs, n)   
      if lifeBar.LifeRestant > -1 then
      lifeBar.LifeRestant = lifeBar.LifeRestant - math.random(15,20)
      end
    end
  end
  if tir.type == 1 then
    if colide(tir.x,tir.y,tir.l,tir.h,hero2.x,hero2.y,hero2.l,hero2.h) == true  then 
        tir.supprime = true
        tir.x = -10000
        table.remove(liste_tirs, n)   
      if lifeBar.LifeRestant2 > -1 then
        lifeBar.LifeRestant2 = lifeBar.LifeRestant2 - math.random(15,20)
      end
    end
  end  
------------- Utile pour le mode Player vs IA ------------
    local reaction = love.math.random(75,120)
  if tir.type == 1 then
    if colide(tir.x, tir.y, tir.l, tir.h, hero2.x - reaction , hero2.y, hero2.l , hero2.h ) == true  then 
      Etat = "Jump"
    else
      Etat = "Attente"
    end
  end
    
    
    if Colide_Tir() == true then            
      tir.supprime = true
      table.remove(liste_tirs, n)      
    end
  end
  end
end


function UpdateTir()
  if lifeBar.LifeRestant2 > 0 then
    if hero2.coldownPretTir > 1 then
      if love.keyboard.isDown(touche.TirP2) then
        hero2.coldownPretTir  = 0 ---- active le coldown
        if hero2.direction == 1 then
          CreeTir("knife",hero2.x + 16,hero2.y + 32,1,2)
        else
          CreeTir("knife",hero2.x + 16,hero2.y + 32,2,2)
        end
      end
    end
  end
  
  
  if lifeBar.LifeRestant > 0 then
    if hero.coldownPretTir > 1 then
      if love.keyboard.isDown(touche.TirP1) then
        hero.coldownPretTir  = 0 ---- active le coldown

        love.graphics.setColor(150,150,150)
        if hero.direction == 1 then
          CreeTir("knife",hero.x + 16,hero.y + 32,1,1)
        else
          CreeTir("knife",hero.x + 16,hero.y + 32,2,1)
        end
        love.graphics.setColor(255,255,255)
      end
    end
  end  

end



function drawTirKnife()
         local n
  for n=1,#liste_tirs do
     
    local t = liste_tirs[n]
    if t.direction == 1 then
      love.graphics.draw(t.image, t.x, t.y, 0, 1, 1, t.l/2, t.h/2) ----- 0 pour le valeur de base du knife
    else
      love.graphics.draw(t.image, t.x, t.y, - math.pi, 1, 1, t.l/2, t.h/2)  ---- Math.Pi pour retourné le knife
    end
  end
end 

function Colide_Tir()
  for n=1,#liste_tirs do
    local s = liste_tirs[n]
    ligne = math.floor((s.x/32) + 1)
    colonne = math.floor((s.y/32) + 1)
    vide = 0

    if map[colonne][ligne] ~= 0 then 
      if map[colonne][ligne] ~= 2 then
        return true   
        
      end
    end   
  end
end
function drawTimerKnife()
  Jauge1 = hero.coldownPretTir * 200 -- x200 pour que la jauge soit visible car le cooldown tir est de 0 à 1
  Jauge2 = hero2.coldownPretTir * 200
  
  love.graphics.setColor(200,200,200)
    love.graphics.rectangle("fill",largeur-110,40,200,20)
    love.graphics.rectangle("fill",10,40,200,20)
  love.graphics.setColor(0,0,0)
    love.graphics.rectangle("line",largeur - 110 , 39, 202, 22)
    love.graphics.rectangle("line",9,39,202,22)
  love.graphics.setColor(255,131,50)
    love.graphics.rectangle("fill",largeur - 110, 40, Jauge2, 20)
    love.graphics.rectangle("fill",10,40,Jauge1,20)
  love.graphics.setColor(255,255,255)

--largeur- 55
end
----------------Update------

-----Fonction update du hero jeu Avanture ------------
function avantureUpdate(dt)
  ----Neige a travers les fenetres ------
    Updateparticle()
    TraitementDesparticles(dt)
    
    ----Gere les tirs --------
    TraitementDesTirsAventure(dt)
    
  -----Gere les sprites -------
    SpriteManager(dt)
    deadManager(dt)

 ---------Attaque------------------
  creeAttaque(dt)
  DegatsEpe()
  --------Power------
  TeleportationAventure(dt)
    -------Deplacement-----------
  SautEtDeplacement(dt)
  --------Gravity-------------
   if colideAvanture(salleCourante,"down",hero.x,hero.y) == true then
    hero.y = hero.y + Gravity
  end
  CurrendTimer1(dt)  -------Animation du sprite (courrir, attendre, sauter...)

  



end

function TeleportationAventure(dt)
   hero.tpFrame = math.floor(hero.tpTimer)
  if hero.disparition == true then
    if hero.direction == 0 then
      if colideAvanture(salleCourante,"tpLeft",hero.x,hero.y) == true then
      
          hero.tpTimer = hero.tpTimer + 25 * dt  
      else
        hero.disparition = false 
        hero.move = true
      end
    else
      if colideAvanture(salleCourante,"tpRight",hero.x,hero.y) == true then
          hero.tpTimer = hero.tpTimer + 25 * dt  
      else
        hero.disparition = false 
        hero.move = true
      end
    end
  end  
  
  if hero.tpTimer > 9 then   ---- Change la frame du hero
      hero.tpTimer = 1 
      hero.disparition = false
      hero.aparition = true   ---- initialise les autres phases
      hero.tp = true
  end
  
  
  if hero.tp == true then
    if hero.direction == 1 then   ---- Teleportation 
      cameraX = cameraX - 6*32     ------- La camera bouge mais pas le personnage
     else
      cameraX = cameraX + 6*32     ------- La camera bouge mais pas le personnage
    end
    hero.tp = false
    hero.tpTimer = 9 
  end
  
  
  if hero.aparition == true then
    hero.tpTimer = hero.tpTimer - 25 * dt
  end
  if hero.tpTimer < 1 then
      hero.tpTimer = 1 
      hero.disparition = false
      hero.aparition = false  ------- Réinitialisation 
      hero.tp = false
      hero.move = true
  end
  
end


function SautEtDeplacement(dt)
  if love.keyboard.isDown(touche.AllerDroiteP1) then
    if colideAvanture(salleCourante,"right",hero.x,hero.y) == true then
        if hero.move == true then
          if hero.x < largeur *  2/3 then
            hero.x = hero.x + MoveSpeed * dt
          else
            cameraX = cameraX - MoveSpeed * dt
          end
        end
    end
  end
  
  if love.keyboard.isDown(touche.AllerGaucheP1) then
    if colideAvanture(salleCourante,"left",hero.x,hero.y) == true then 
      if hero.move == true then
        if hero.x > largeur * 1/3 then
          hero.x = hero.x - MoveSpeed * dt
        else
          cameraX = cameraX + MoveSpeed * dt------- La camera bouge mais pas le personnage
        end
      end
    end
  end

  if love.keyboard.isDown(touche.AllerBasP1) then
    if colideAvanture(salleCourante,"dalles",hero.x,hero.y) == true then 
      if hero.move == true then       
          hero.y = hero.y + MoveSpeed * dt
      end
    end
  end

----------Update Saut----------------------------
      -------------Vois si on peut sauter ou si on est dans le vide------------------
  if colideAvanture(salleCourante,"down",hero.x,hero.y) ~= true then
    jumpReady = true
  else 
    jumpReady = false
  end
 ------------- Vitesse du saut et déplacement du perso pendant le saut--------------( si on est en tp, on ne descend pas )

  if hero_vx > 0 then
    if colideAvanture(salleCourante,"up",hero.x,hero.y) == true then
        hero_vx = hero_vx -2
        hero.y =hero.y - (hero_vx - 2 )
    end
  end

  if hero.move == false then
    hero_vx = 0
    Gravity = 0
  else Gravity = 10 
  end

  if colideAvanture(salleCourante,"up",hero.x,hero.y) ~= true then
      hero_vx = 0
  end    
    
  
end
function colideAvanture(pMap,pType,pX,pY)
  map = pMap
  t = pType 
  x = pX 
  y = pY
  

  --// 0 = vide // 1 = mur // 2 = dalles //
 

  ligne   = math.floor(((x + math.abs(cameraX) - 1000) / 32) + 1)
  colonne = math.floor(((cameraY + y)/32) + 1)
  
  



if t == "left" then
    if map[colonne][ligne] == (0 or nil) then 
      if map[colonne+1][ligne] == (0 or nil) then 
        
        return true  
      end
    end
elseif t == "right" then
    if map[colonne][ligne+1] == 0 or map[colonne][ligne+1] == 2 or map[colonne][ligne+1] == nil then 
      if map[colonne+1][ligne+1] == 0 or map[colonne+1][ligne+1] == 2 or map[colonne][ligne+1] == nil then 
        return true    
      end
      
      
    end
elseif t == "up" then
    if map[colonne][ligne] == 0 or 
        map[colonne][ligne] == 2 then 
      return true    
    end
elseif t == "down" then
    if map[colonne+2][ligne+1] == 0 then 
      return true    
    end
 elseif t == "dalles" then
    if map[colonne+2][ligne] == 2 or 
    map[colonne+2][ligne + 1] == 2 then 
      return true   
    end    
elseif t == "tpRight" then
    if map[colonne][ligne] == 0 then 
      if map[colonne+1][ligne] == 0 then 
        if map[colonne+1][ligne+3] == 0 or map[colonne+1][ligne+3] == 2 then
          if map[colonne+1][ligne+7] == 0 or map[colonne+1][ligne+7] == 2 then
            return true   
          end
        end
      end
    end
elseif t == "tpLeft" then
    if map[colonne][ligne] == 0 or map[colonne][ligne] == 2 then 
      if map[colonne+1][ligne] == 0 or map[colonne+1][ligne] == 2 then 
        if map[colonne+1][ligne-5] == 0 or  map[colonne+1][ligne-5] == 2 then 
          return true   
        end
      end
    end
elseif t == "tir" then
  if map[colonne][ligne] ~= 0 then 
      if map[colonne][ligne] ~= 2 then
        return true   
      end
    end   
end
  
end
-------------Monstre Sprite mort des monstre, animation ........................
liste_Sprite = {}
function creeSprite(pType,pLevel,pX,pY)
  local sprite = {}

  sprite = {}
  sprite.t = pType
  sprite.nbF = pNbFrame
  sprite.x = pX
  sprite.y = pY
  sprite.etat = false  
  sprite.level = pLevel
  sprite.timer = 1
  sprite.dirrection = 0
  sprite.supprime = false
  sprite.action = "attenteD'activation"
  if sprite.t == "bat" then
    sprite.nbFrame = 7
    sprite.nbFrameDie = 8
  elseif sprite.t == "knight" then
    sprite.nbFrame = 8
    sprite.nbFrameDie = 8
  elseif sprite.t == "troll" then
    sprite.nbFrame = 8
    sprite.nbFrameDie = 8
  end
  
  
  
  table.insert(liste_Sprite,sprite)
  
end

function drawSprite()
  for n=#liste_Sprite,1,-1 do
    local s = liste_Sprite[n]
    local dir,pos
  
    local frame = math.floor(s.timer)
    if s.etat == true then
      if s.t == "bat" then
          if s.dirrection == 0 then
            dir = 0 - 1/5
            pos = 0
          else
            dir = 1/5
            if s.t ~= "troll" then
              pos = -50
            else
              pos = -100
            end
          end
        if s.level == 1 then
          love.graphics.draw(bat.booger[frame],s.x + cameraX + 1000 + pos,s.y,0,dir,1/5)
        elseif s.level == 2 then
          love.graphics.draw(bat.brains[frame],s.x + cameraX + 1000,s.y,0,dir,1/5)
        elseif s.level == 3 then
          love.graphics.draw(bat.purple[frame],s.x + cameraX + 1000,s.y,0,dir,1/5)
        elseif s.level == 4 then
          love.graphics.draw(bat.square[frame],s.x + cameraX + 1000,s.y,0,dir,1/5)
        end
        
      elseif s.t == "troll" then
            if s.dirrection == 1 then
              dir = 0 - 1/7.9
              pos = 0
            else
              dir = 1/7.9
              pos = -40
            end     
        if s.level == 1 then
          love.graphics.draw(troll.green.idle[frame],s.x + cameraX + 1000 + pos,s.y,0,dir,1/8.3)
        end
        
      elseif s.t == "knight" then
            if s.dirrection == 1 then
              dir = 0 - 1/22.5
              pos = 0
            else
              dir = 1/22.5
              pos = -40
            end     
        if s.level == 1 then
          if s.action == "attaquer" then
            love.graphics.draw(knight.lance.attack[frame],s.x + cameraX + 1000 + pos,s.y,0,dir,1/16.1)
          else
            love.graphics.draw(knight.lance.idle[frame],s.x + cameraX + 1000 + pos,s.y,0,dir,1/16.1)
          end
        end
      end     
    end
  end
end

function SpriteManager(dt)
  DegatsKnifeAventure()
  DegatsSwordAventure()
  GravitySpriteNonVolant()
  AttaqueDesSprites(dt)
  collidePlayerSprite()
  for n=#liste_Sprite,1,-1 do
    local s = liste_Sprite[n]
    s.timer = s.timer + 6 * dt 
    if s.timer > s.nbFrame - 0.5 then  --------- Animationn des sprites
      s.timer = 1
    end

    if s.supprime == true then
      deadSprite(s.x, s.y, s.t, s.level,s.dirrection) -------- Animation a la mort d'un sprite
      table.remove(liste_Sprite,n)
    end


  end
end


function AttaqueDesSprites(dt)
   
  for n=#liste_Sprite,1,-1 do
  local s = liste_Sprite[n]
    hX   = math.floor(((hero.x + math.abs(cameraX) - 1000) / 32) + 1)
    hY = math.floor((cameraY + hero.y)/32) 
    sX   = math.floor(s.x /32)
    sY = math.floor(s.y /32)
    mx = love.mouse.getX()
    my = love.mouse.getY()
    lignmX = math.floor(((mx + math.abs(cameraX) - 1000) / 32) + 1)--- mouse
    colmY  = math.floor((cameraY + my)/32) 

    ------------------------Activation des sprites lorcequ'il sont a l'ecran----------------------------------------------
      heroPos   = math.floor(((hero.x + math.abs(cameraX) - 1000) / 32)+1)
      spritePos = math.floor(s.x /32)
    if spritePos + 20 < heroPos or spritePos - 20 > heroPos then -----------Active les monstre a l'ecran 
      s.etat = false
    else
      s.etat = true
    end
    -------------------Changement de dirrection--------------------

        if s.etat == true then
        
        
          if hX > sX then
            s.dirrection = 0 
          else
            s.dirrection = 1 
          end
    ----------------------Attaque de chaque sprite activé----------------------
      
        -------------Bat--------------
        if s.t == "bat" then
          
            
          angle = math.angle(hX*32 + 5,hY*32 ,sX*32,sY*32)
          vx = 50 * math.cos(angle)
          vy = 50 * math.sin(angle)
          s.x = s.x - vx * dt
          s.y = s.y - vy * dt
       
          ---------------Chevalier ----------------------------------------
        elseif s.t == "knight" then
          if math.dist(hX,hY,sX,sY) < 10 then
            
            if hY == sY  or
               hY -1  == sY  then
                s.action = "attaquer"

            else 
                s.action = "Attente"
            end
            
            if s.action == "attaquer" then
              if s.timer  > s.nbFrame - 0.6 then  
                CreeTir("lance", s.x, s.y+32,s.dirrection,3)
              end
            end
          end
        end ---- s.t 
      end ------ s.etat = true (sprite activé)
      
    
  end ----  n=#liste_Sprite,1,-1 do
end ---- function end

function collidePlayerSprite()
  for n=#liste_Sprite,1,-1 do
  local s = liste_Sprite[n]  
  local heroX   = math.floor(hero.x + math.abs(cameraX) - 1000)
    if s.t == "knight" then
      if hero.direction == 1 then
        if colide(heroX + 5, hero.y-5, 36, 74,s.x-42 ,s.y,64,42) then
        
        end
      else
        if colide(heroX + 5, hero.y-5, 36, 74,s.x-42 ,s.y,64,42) then 
        
        end
      end
      elseif s.t == "bat" then
        if hero.direction == 1 then
          if colide(heroX + 5, hero.y-5, 36, 74,s.x-42 ,s.y,64,42) then
          
          end
        else
          if colide(heroX + 5, hero.y-5, 36, 74,s.x-42 ,s.y + 10 ,32 , 32 ) then 
          
          end
        end
      elseif s.t == "troll" then
        if hero.direction == 1 then
          if colide( heroX + 5, hero.y-5, 36, 74, s.x - 62, s.y , 64, 64) then
          
          end
        else
          if colide( heroX + 5, hero.y-5, 36, 74, s.x - 42, s.y, 64, 64) then 
          
          end
        end
    end 
  end
end


function DegatsSwordAventure()
  for n=#liste_Sprite,1,-1 do
  local s = liste_Sprite[n]  
    local heroX   = math.floor(hero.x + math.abs(cameraX) - 1000)

    if hero.attaq == true then
      if s.t == "knight" then
        if hero.direction == 1 then
          if colide(heroX + 25,hero.y - 10,hero.l + 10 ,hero.h + 25  ,s.x-42 ,s.y,64,42) then
            s.supprime = true
          end
        else
          if colide(heroX - 30,hero.y - 10,hero.l + 10 ,hero.h + 25 ,s.x-42 ,s.y,64,42) then 
            s.supprime = true
          end
        end
    
    
      elseif s.t == "bat" then
        if hero.direction == 1 then
          if colide(heroX + 25,hero.y - 10,hero.l + 10 ,hero.h + 25  ,s.x-42 ,s.y,64,42) then
            s.supprime = true
          end
        else
          if colide(heroX - 30,hero.y - 10,hero.l + 10 ,hero.h + 25 ,s.x-42 ,s.y + 10 ,32 , 32 ) then 
            s.supprime = true
          end
        end
        
        
      elseif s.t == "troll" then
        if hero.direction == 1 then
          if colide( heroX + 25, hero.y - 10, hero.l + 10 , hero.h + 25  , s.x - 62, s.y , 64, 64) then
            s.supprime = true
          end
        else
          if colide( heroX - 30, hero.y - 10, hero.l + 10,hero.h + 25, s.x - 42, s.y, 64, 64) then 
            s.supprime = true
          end
        end
      end  
    end
  end
end










function DegatsKnifeAventure()
  for n=#liste_Sprite,1,-1 do
  local s = liste_Sprite[n]
    local i
    for i=#liste_tirs,1,-1 do
      local t = liste_tirs[i]
      if t.type ~= 3 then
        if s.t == "knight" then
          if hero.direction == 1 then
            if colide( t.x - 10 , t.y,25,10,s.x-42 ,s.y,64,42) then
              s.supprime = true
              table.remove(liste_tirs,i)
            end
          else
            if colide( t.x - 10 , t.y,25,10,s.x-42 ,s.y,64,42) then 
              s.supprime = true
              table.remove(liste_tirs,i)
            end
          end
      
        elseif s.t == "bat" then
          if hero.direction == 1 then
            if colide( t.x - 10 , t.y,25,10,s.x-42 ,s.y,64,42) then
              s.supprime = true
              table.remove(liste_tirs,i)
            end
          else
            if colide( t.x - 10 , t.y,25,10,s.x-42 ,s.y + 10 ,32 , 32 ) then 
              s.supprime = true
            end
          end
          
          
        elseif s.t == "troll" then
          if hero.direction == 1 then
            if colide( t.x - 10 , t.y,25,10, s.x - 62, s.y , 64, 64) then
              s.supprime = true
              table.remove(liste_tirs,i)
            end
          else
            if colide( t.x - 10 , t.y,25,10, s.x - 42, s.y, 64, 64) then 
              s.supprime = true
              table.remove(liste_tirs,i)
            end
          end
        end  
      end
    end
  end
end


function GravitySpriteNonVolant()
  for n=#liste_Sprite,1,-1 do
  local s = liste_Sprite[n]
    ligne   = math.floor(s.x /32)
    colonne = math.floor(s.y /32)
    
    if s.t == "knight" or s.t == "troll" then
      if salleCourante[colonne+3][ligne+1] == 0 then 
        s.y = s.y + Gravity
      end
    end
    
  end
end

liste_dead = {}
function deadSprite(pX,pY,pType,pLevel,pDirrection)
  local dead = {}

  dead.x = pX
  dead.y = pY
  dead.type = pType
  dead.level = pLevel
  dead.dirrection = pDirrection
  if dead.type == "bat" then
    dead.nbFrame = 8
  else
    dead.nbFrame = 8
  end
  
    dead.timer = 1
  
    table.insert(liste_dead,dead)
    
    

end
function deadManager(dt)
  for n=#liste_dead,1,-1 do
    local d = liste_dead[n]
    if d.timer < d.nbFrame - 1 then
      d.timer = d.timer + d.nbFrame * dt    ----------- Pour que sa supprime nimporte quel sprite en 1 sec 
    end
  
    if d.timer > d.nbFrame - 1  then
      d.timer = 1
      table.remove(liste_dead,n)
    end
  
  end
end
function drawDead()
  for n=#liste_dead,1,-1 do
    local d = liste_dead[n]
    frame = math.floor(d.timer) 
    if d.type == "bat" then
      if d.level == 1 then
        
        love.graphics.draw(bat.boogerDie[frame],d.x+32   + cameraX + 1000,d.y-32,0,-1/5,1/5)
      elseif d.level == 2 then
        love.graphics.draw(bat.brainsDie[frame],d.x-200   + cameraX + 1000,d.y-100,0,1/5,1/5)
      elseif d.level == 3 then
        love.graphics.draw(bat.purpleDie[frame],d.x+70   + cameraX + 1000,d.y-70,0,-1/5,1/5)
      elseif d.level == 4 then
        love.graphics.draw(bat.squareDie[frame],d.x-185  + cameraX + 1000,d.y-95,0,1/5,1/5)
      end
      
      
    elseif d.type == "troll" then
      if d.level == 1 then

        love.graphics.draw(troll.green.die[frame],d.x    + cameraX + 1000,d.y,0,-1/7.9,1/8.3)
      end
      
    elseif d.type == "knight" then
      if d.level == 1 then

        love.graphics.draw(knight.lance.die[frame],d.x    + cameraX + 1000,d.y,0,-1/22.5,1/16.1)
      end
    end
  end
end




function TraitementDesTirsAventure(dt)
   
  if ecranCourant == "avanture" then
   ToucheTirAventure()
   coldownTir(dt)
   local n
  -- traitement des tirs
    for n=#liste_tirs,1,-1 do
      local tir = liste_tirs[n]
      tir.x = tir.x + tir.speed * dt
      local tirX   = math.floor(tir.x + cameraX + 1000)

    
    if colideAvanture(salleCourante,"tir",tirX,tir.y) == true then
      table.remove(liste_tirs, n)    
    end
    end
  end
end

function ToucheTirAventure()
  local heroX   = math.floor(hero.x + math.abs(cameraX) - 1000)
  if hero.coldownPretTir > 1 then
    if love.keyboard.isDown(touche.TirP1) then
      hero.coldownPretTir  = 0 ---- active le coldown
      if hero.direction == 1 then
        CreeTir("knife",heroX + 16,hero.y + 32,1,1)
      else
        CreeTir("knife",heroX + 16,hero.y + 32,2,1)
      end
    end  
  end
end

function drawTirKnifeAventure()
         local n
  for n=1,#liste_tirs do
    local t = liste_tirs[n]
    if t.type == 3 then 
      if t.direction == 0 then
        
        love.graphics.draw(t.image , t.x + cameraX + 1000 , t.y , 0 , 1/22, 1/16) 
      else
        love.graphics.draw(t.image, t.x + cameraX + 1000 , t.y, 0, -1/22, 1/16)
      
      end
    else 
      if t.direction == 0 then
        
        love.graphics.draw(t.image , t.x + cameraX + 1000 , t.y , 0 , 1, 1) 
      else
        love.graphics.draw(t.image, t.x + cameraX + 1000 , t.y, 0, -1, 1)
        
        
      
      end
    end
  end
end 



-------------------------------
function joueur1_Update(dt)
  ---------Attaque------------------
  creeAttaque(dt)
  DegatsEpe()
  Teleportation(dt)
    -------Deplacement-----------
  goRight(dt)
  goLeft(dt)
  goDown(dt)
  JumpUpdate(dt)
  --------Gravity-------------
  if Colide_Down(map) == true then
    hero.y = hero.y + Gravity
  end
  --------Rafréchissement des immages---------
  CurrendTimer1(dt)
  
  if hero.x > 900 then
    hero.x = 0+32
  end
  
  if hero.x < 0 then
    hero.x = 900
  end
  
  if hero.y > 600 then
    hero.y = 0+64
  end
  
  if hero.y < 40 then
    hero.y = 600
  end
  
  
  
end

 
function joueur2_Update(dt)
    -------Deplacement-----------
  goRight2(dt)
  goLeft2(dt)
  goDown2(dt)
  JumpUpdate2(dt)
  --------Gravity-------------
  if Colide2_Down() == true then
    hero2.y = hero2.y + Gravity
  end
  --------Rafréchissement des immages---------

  CurrendTimer2(dt)
  if hero2.x > 900 then
    hero2.x = 0+32
  end
  
  if hero2.x < 0 then
    hero2.x = 900
  end
  
  if hero2.y > 600 then
    hero2.y = 0+64
  end
  
  if hero2.y < 40 then
    hero2.y = 600
  end
  

  
  
end

function JoueurIA_Update(dt)
-------Deplacement-----------
    EtatIA(dt)

  --------Gravity-------------
  JumpUpdate2(dt)
  if Colide2_Down() == true then
    hero2.y = hero2.y + Gravity
  end
  --------Rafréchissement des immages---------
  CurrendTimer2(dt)
  if hero2.x > 900 then
    hero2.x = 0+32
  end
  
  if hero2.x < 0 then
    hero2.x = 900
  end
  
  if hero2.y > 600 then
    hero2.y = 0+64
  end
  
  if hero2.y < 40 then
    hero2.y = 600
  end
   

end

local choix = math.random(1,2)
local sequence = {}
      sequence[1] = "1.1.Depart"
      sequence[2] = "2.1.Depart"
      sequence[3] = "3.1.Depart"
      NombreDeSequence = 3
      choix = love.math.random(1,NombreDeSequence)
function EtatIA(dt)
  if choix == 1 then
    Sequence1(dt)
  elseif choix == 2 then
    Sequence2(dt)
  elseif choix == 3 then
    Sequence3(dt)
  end
 
  
  EtatJump()
  EtatPrepareAttaquer()
  EtatAttaquer()
  EtatTouverDirection()
end


--------Séquance de déplacement de l'IA ------- Et oui, c'est tres mal codé .........
function Sequence3(dt)
  if hero2.direction == 0 then
   Etat = "AllerGauche"
  else 
    Etat = "AllerDroite"
  end

  if sequence[3] == "3.1.Depart" then
    if Colide2_Left() == true then 
      hero2.x = hero2.x - MoveSpeed * dt
    end   
    
    if hero2.x < 800 then
      Etat = "Attente"
      sequence[3] = "3.2.Atterrire"
    end
  end
  
  if sequence[3] == "3.2.Atterrire" then
    if Colide2_Left() == true then 
      hero2.x = hero2.x - MoveSpeed * dt 
      Etat = "Jump"
    end   
    
    if hero2.x < 650 then
      Etat = "Attente"
      sequence[3] = "3.3.AttendreLeSaut"
    end
  end
  
  
  if sequence[3] == "3.3.AttendreLeSaut" then
    if Colide2_Left() == true then 
      hero2.x = hero2.x - MoveSpeed * dt 
    end   
    
    if hero2.x < 200 then
      Etat = "Attente"
      sequence[3] = "3.4.Sauter"
    end
  end
  
  if sequence[3] == "3.4.Sauter" then
    if Colide2_Left() == true then 
      hero2.x = hero2.x - MoveSpeed * dt 
      Etat = "Jump"
    end   
    
    if hero2.x < 100 then
      Etat = "Attente"
      sequence[3] = "3.5.RetourDépart"
    end
  end

  
  
  if sequence[3] == "3.5.RetourDépart" then
    if Colide2_Left() == true then 
      hero2.x = hero2.x - MoveSpeed * dt 
    end   
    
    if hero2.x > 850 then
      hero2.x = 850
      hero2.y = 390
      sequence[3] = "3.1.Depart"
      Etat = "Attente"
      choix = math.random(1,NombreDeSequence)
    end
  end  
end

function Sequence2(dt)
  if hero2.direction == 0 then
   Etat = "AllerGauche"
  else 
    Etat = "AllerDroite"
  end

  if sequence[2] == "2.1.Depart" then
    if Colide2_Left() == true then 
      EtatJump()
      hero2.x = hero2.x - MoveSpeed * dt 

    end   
    
    if hero2.x < 500 then
       sequence[2] = "2.2.SauterPlateforme1"
    end
  end
  
  
  
  
  
  if sequence[2] == "2.2.SauterPlateforme1" then
    if Colide2_Left() == true then 
      EtatJump()
      Etat = "Jump"
      hero2.x = hero2.x - MoveSpeed * dt 

    end   
    
    if hero2.x < 400 then
       sequence[2] = "2.3.SauterPlateforme2"
    end
  end
  
  if sequence[2] == "2.3.SauterPlateforme2" then
    if Colide2_Right() == true then 
      EtatJump()
      Etat = "Jump"
      hero2.x = hero2.x + MoveSpeed * dt 
      Etat = "Attente"
    end   
    
    if hero2.x > 520 then
       sequence[2] = "2.4.Sauter"
    end
  end
  

  if sequence[2] == "2.4.Sauter" then
    if Colide2_Right() == true then 
      EtatJump()
      Etat = "Jump"
    end   
    
    if hero2.y > 450 then
      sequence[2] = "2.5.AvancerVersLeDepart"
      Etat = "Attente"
    end
  end
  
  
  
  
  if sequence[2] == "2.5.AvancerVersLeDepart" then
    if Colide2_Right() == true then 
      hero2.x = hero2.x + MoveSpeed * dt 
    end   
    
    if hero2.x > 725 then
      sequence[2] = "2.5.SauterAuDepart"
      Etat = "Attente"
    end
  end
  
  
  
  if sequence[2] == "2.5.SauterAuDepart" then
    if Colide2_Right() == true then 
      hero2.x = hero2.x + MoveSpeed * dt 
      Etat = "Jump"
    end   
    
    if hero2.x > 850 then
      hero2.x = 850
      hero2.y = 390
      sequence[2] = "2.1.Depart"
      Etat = "Attente"
      choix = math.random(1,2)
    end
  end
end
function Sequence1(dt)
  Etat = "AllerGauche"
  if sequence[1] == "1.1.Depart" then
    if Colide2_Left() == true then 
      hero2.x = hero2.x - MoveSpeed * dt 
      
    end    
    if hero2.x < 500 then
       sequence[1] = "1.2.Descendre"
    end
  end
  if sequence[1] == "1.2.Descendre" then
    if Colide2_Dalles() == true then 
      hero2.y = hero2.y + MoveSpeed * dt 
    end
  
    if hero2.y < 100 then
      sequence[1] = "1.3.ChangerPlateForme"
    end
  end
  
  
  
  
  if sequence[1] == "1.3.ChangerPlateForme" then
    if Colide2_Left() == true then 
      Etat = "AllerGauche"
      hero2.x = hero2.x - MoveSpeed * dt 
    end 
  
    if hero2.x < 270 then
      sequence[1] = "1.4.Sauter"
    end
  end
  
  
  
  
  if sequence[1] == "1.4.Sauter" then
    
    if Colide2_Left() == true then 
      Etat = "Jump"
      hero2.x = hero2.x - MoveSpeed * dt 

    end 
  
    if hero2.x < 80 then
      sequence[1] = "1.5.RetourDepart"
    end
  end
  
  if sequence[1] == "1.5.RetourDepart" then
    if Colide2_Left() == true then 
      EtatJump()
      Etat = "AllerGauche"
      hero2.x = hero2.x - MoveSpeed * dt 

    end 
  
    if hero2.x > 500 then
      sequence[1] = "1.1.Depart"
      choix = math.random(1,NombreDeSequence)

    end
  
  end  
end

------Etat de L'IA -------
function EtatJump()
  if Etat == "Jump" then
    if jumpReady2 then
      hero2_vx = hauteurJump
    end    
  end
end
function EtatPrepareAttaquer()
  if hero.y + 64 > hero2.y + 32 then---- (Hauteur du tir de L'IA)
    if hero.y < hero2.y + 32 then
      EtatAttque = true
    else
      EtatAttque = false
    end
  else
    EtatAttque = false
  end    
end
  

function EtatTouverDirection()
    if hero.x > hero2.x then
    hero2.direction = 1 
  else
    hero2.direction = 0 
  end
end
function EtatAttaquer()
  
  if EtatAttque == true then
    if lifeBar.LifeRestant2 > 0 then
      if hero2.coldownPretTir > 1 then
        hero2.coldownPretTir  = 0 ---- active le coldown
        if hero2.direction == 1 then
          CreeTir("knife",hero2.x + 16,hero2.y + 32,1,2)
        else
          CreeTir("knife",hero2.x + 16,hero2.y + 32,2,2)
        end
      end
    end
  end  
  
end


-----------------
function fGameOver()
  if lifeBar.LifeRestant2 <= 0 then
    Mode = 1
    ecranCourant = "GameOver"
  end
  
  if lifeBar.LifeRestant <= 0 then  
    Mode = 2
    ecranCourant = "GameOver"
  end
end
-----------------
function JumpUpdate(dt)
  -------------Vois si on peut sauter ou si on est dans le vide------------------
  if Colide_Down(map) ~= true then
    jumpReady = true
  else 
    jumpReady = false
  end
 ------------- Vitesse du saut et déplacement du perso pendant le saut--------------( si on est en tp, on ne descend pas )

  if hero_vx > 0 then
    if Colide_Up(map) == true then
      hero_vx = hero_vx -2
      hero.y =hero.y - (hero_vx - 2 )
    end
  end

if hero.move == false then
  hero_vx = 0
  Gravity = 0
else Gravity = 10 
end

  if Colide_Up(map) ~= true then
    hero_vx = 0
  end    
  
end
function JumpUpdate2()
  -------------Vois si on peut sauter ou si on est dans le vide------------------
  if Colide2_Down() ~= true then
    jumpReady2 = true
  else 
    jumpReady2 = false
  end
 ------------- Vitesse du saut et déplacement du perso pendant le saut--------------

  if hero2_vx > 0 then
    if Colide2_Up() == true then
    hero2_vx = hero2_vx -2
    hero2.y =hero2.y - (hero2_vx - 2 )
    
    end
  end

  if Colide2_Up() ~= true then
    hero2_vx = 0
  end    
  
end





  





--
function CurrendTimer1(dt)
      hero.imgCurrent = hero.imgCurrent + 11 * dt
  if math.floor(hero.imgCurrent) > #hero.idleLeft then
    hero.imgCurrent = 1
  end
  
    hero.imgCurrentTimer = hero.imgCurrentTimer + 10 * dt
  if math.floor(hero.imgCurrentTimer) > #hero.idleLeft then
    hero.imgCurrentTimer = 1
  end
  
end

function CurrendTimer2(dt)
      hero2.imgCurrent = hero2.imgCurrent + 11 * dt
  if math.floor(hero2.imgCurrent) > #hero2.idleLeft then
    hero2.imgCurrent = 1
  end
  
  
    hero2.imgCurrentTimer = hero2.imgCurrentTimer + 20 * dt
  if math.floor(hero2.imgCurrentTimer) > 11 then
    hero2.imgCurrentTimer = 1
  end
end

---------------Colision Joueur 1-----
function Colide_TpLeft(pMap)
  MapColide = pMap
   ligne = math.floor((hero.x/32) + 1)
  colonne = math.floor((hero.y/32) + 1)
  vide = 0
    if MapColide[colonne][ligne] == vide or MapColide[colonne][ligne] == 2 then 
      if MapColide[colonne+1][ligne] == vide or MapColide[colonne+1][ligne] == 2 then 
          if MapColide[colonne+1][ligne-2] == vide or  MapColide[colonne+1][ligne-2] == 2 then 
        return true   
          end
        
      end
    end
end

function Colide_TpRight(pMap)
  MapColide = pMap
   ligne = math.floor((hero.x/32) + 1)
  colonne = math.floor((hero.y/32) + 1)
  vide = 0
    if MapColide[colonne][ligne] == vide then 
      if MapColide[colonne+1][ligne] == vide then 
        if MapColide[colonne+1][ligne+3] == vide or MapColide[colonne+1][ligne+3] == 2 then
          if MapColide[colonne+1][ligne+4] == vide or MapColide[colonne+1][ligne+4] == 2 then
        return true   
          end
        end
      end
    end
end




function Colide_Left(pMap)
  MapColide = pMap
   ligne = math.floor((hero.x/32) + 1)
  colonne = math.floor((hero.y/32) + 1)
  vide = 0
    if MapColide[colonne][ligne] == vide then 
      if MapColide[colonne+1][ligne] == vide then 
        return true    
      end
    end
end

function Colide_Right(pMap)
  MapColide = pMap
  ligne = math.floor((hero.x/32) + 1)
  colonne = math.floor((hero.y/32) + 1)
  vide = 0
    if MapColide[colonne][ligne+1] == vide or MapColide[colonne][ligne+1] == 2 then 
      if MapColide[colonne+1][ligne+1] == vide or MapColide[colonne+1][ligne+1] == 2 then 
        return true    
      end
    end
    
end

function Colide_Up(pMap)
    MapColide = pMap

  ligne = math.floor((hero.x/32) + 1.1)
  colonne = math.floor((hero.y/32) + 1.1)

     if MapColide[colonne][ligne] == 0 or 
        MapColide[colonne][ligne] == 2 then 
      return true    
  end

end

function Colide_Down(pMap)
local  MapColide = pMap
  ligne = math.floor((hero.x/32) + 1)
  colonne = math.floor((hero.y/32) + 1)
  vide = 0
  if MapColide[colonne+2][ligne+1] == vide then 
      return true    
  end

end

function Colide_Dalles(pMap)
    MapColide = pMap

    ligne = math.floor((hero.x/32) + 1)
  colonne = math.floor((hero.y/32) + 1)
  vide = 0

   if MapColide[colonne+2][ligne] == 2 or 
      MapColide[colonne+2][ligne + 1] == 2 then 
      return true   
  end    


end





---------------Colision Joueur 2-----
function Colide2_Left()
  
   ligne = math.floor((hero2.x/32) + 1)
  colonne = math.floor((hero2.y/32) + 1)
  vide = 0
    if map[colonne][ligne] == vide then 
      if map[colonne+1][ligne] == vide then 
      return true  
      end
    end
end

function Colide2_Right()
  ligne = math.floor((hero2.x/32) + 1)
  colonne = math.floor((hero2.y/32) + 1)
  vide = 0
    if map[colonne][ligne+1] == vide then 
      if map[colonne+1][ligne+1] == vide then 
      return true    
      end
    end
end

function Colide2_Up()
  ligne = math.floor((hero2.x/32) + 1.1)
  colonne = math.floor((hero2.y/32) + 1.1)

     if map[colonne][ligne] == 0 or 
        map[colonne][ligne] == 2 then 
      return true    
  end

end

function Colide2_Down()
  ligne = math.floor((hero2.x/32) + 1)
  colonne = math.floor((hero2.y/32) + 1)
  vide = 0

  if map[colonne+2][ligne+1] == vide then 
    return true    
  end

end

function Colide2_Dalles()
  ligne = math.floor((hero2.x/32) + 1)
  colonne = math.floor((hero2.y/32) + 1)
  vide = 0

  if map[colonne+2][ligne] == 2 or 
     map[colonne+2][ligne + 1] == 2 then 
      return true   
  end    
end



----------Touches --------------
----------------Key---------
function goRight(dt)
  if love.keyboard.isDown(touche.AllerDroiteP1) then
    if Colide_Right(map) == true then
        if hero.move == true then
      hero.x = hero.x + MoveSpeed *dt
        end
    end
  end
end
function goLeft(dt)
  if love.keyboard.isDown(touche.AllerGaucheP1) then
    if Colide_Left(map) == true then 
        if hero.move == true then
          hero.x = hero.x - MoveSpeed * dt
        end
    end
  end
end
function goDown(dt)
   if love.keyboard.isDown(touche.AllerBasP1) then
     if Colide_Dalles(map) == true then 
        if hero.move == true then       
          hero.y = hero.y + MoveSpeed * dt
        end
    end
  end
end



function goRight2(dt)
  if love.keyboard.isDown(touche.AllerDroiteP2) then
    if Colide2_Right() == true then
      hero2.x = hero2.x + MoveSpeed * dt
    end
  end
end
function goLeft2(dt)
  if love.keyboard.isDown(touche.AllerGaucheP2) then
    if Colide2_Left() == true then 
        hero2.x = hero2.x - MoveSpeed * dt
    end
  end
end
function goDown2(dt)
   if love.keyboard.isDown(touche.AllerBasP2) then
     if Colide2_Dalles() == true then 
        hero2.y = hero2.y + MoveSpeed * dt
    end
  end
end




----------------Draw--------


 
 
 -- Barre de vie ------------
 lifeBar = {}
 lifeBar.LifeRestant = 200
 lifeBar.LifeRestant2 = 200
function drawLifeBar()
  love.graphics.setColor( 150, 60, 60)
    love.graphics.rectangle("fill", 9, 9, 201, 21)
    love.graphics.rectangle("fill", largeur - 110, 9, 200, 21)
  love.graphics.setColor( 0, 205, 0)
    love.graphics.rectangle("fill", 10, 10, lifeBar.LifeRestant, 20)
    love.graphics.rectangle("fill", (largeur - 110), 10, lifeBar.LifeRestant2, 20)
  love.graphics.setColor( 0, 0, 0)
    love.graphics.rectangle("line", largeur - 110, 9, 200, 21)
    love.graphics.rectangle("line", 9, 9, 201, 21)
  love.graphics.setColor( 255, 255, 255)
  love.graphics.setFont(font)
    love.graphics.print(math.floor(lifeBar.LifeRestant2 ),(largeur - 110) +lifeBar.LifeRestant2/2,13)
    love.graphics.print(math.floor(lifeBar.LifeRestant), lifeBar.LifeRestant/2, 13)
  love.graphics.setFont(fontpacifico)
  

  if lifeBar.LifeRestant2 < 0 then
    lifeBar.LifeRestant2 = 0
  end
  if lifeBar.LifeRestant < 0 then
    lifeBar.LifeRestant = 0
  end  


end

---------Dessiner la Map----
function drawMap()
 love.graphics.draw(MapCourante,0,0)
end

function drawCarteAvanture()


love.graphics.draw(imgAvanture[1],cameraX + 1000,0)
end

function drawMiniMap()
    local l=0
  local c=0
  local char=0
 
  for l=1, #map do
    for c=1, #map[1] do
      local char = map[l][c]
      if char > 0 then
          love.graphics.rectangle("fill",300+(c-1)*5,1+(l-1)*5,5,5)
        end
      end    
    end
  
  
ligne   = math.floor(((x + math.abs(cameraX)) / 32) + 1)
colonne = math.floor((hero.y/32) + 1)
  
  love.graphics.setColor(250,0,0)
  love.graphics.circle("line",300+ligne * 5, 1+colonne*5,5)
  love.graphics.setColor(255,255,255)

  
end


------------Dessiner/Annimer les deux heros ----------
function drawSpriteMvt()
    if hero.attaq == true then
      if hero.direction == 0 then
        love.graphics.draw(hero.attackLeft[hero.attaqFrame],hero.x-64,hero.y-64,0,1/3,1/2) 
      else
        love.graphics.draw(hero.attackRight[hero.attaqFrame],hero.x-64,hero.y-64,0,1/3,1/2) 
      end
    elseif hero.disparition == true or hero.aparition == true or hero.tp == true then
      if hero.direction == 0 then
        love.graphics.draw(hero.teleportationLeft[hero.tpFrame],hero.x-64,hero.y-64,0,1/3,1/2) 
      else
        love.graphics.draw(hero.teleportationRight[hero.tpFrame],hero.x-64,hero.y-64,0,1/3,1/2) 
      end
    elseif love.keyboard.isDown(touche.JumpP1) then
       if hero.direction == 0 then
        drawHerojump(1)
      else
        drawHerojump(2)
      end
     
    elseif love.keyboard.isDown(touche.AllerDroiteP1) then
      drawHeroWalkRight()
    elseif love.keyboard.isDown(touche.AllerGaucheP1) then
      drawHeroWalkLeft()
    else
      if hero.direction == 0 then
        drawHeroIdleLeft()
      else
        drawHeroIdleRight()
      end
    end
      love.graphics.setColor(255,255,255)

end

function drawHeroIdleLeft()
  love.graphics.draw(hero.idleLeft[math.floor(hero.imgCurrent)],hero.x-64,hero.y-64,0,1/3,1/2) 
end
function drawHeroIdleRight()
  love.graphics.draw(hero.idleRight[math.floor(hero.imgCurrent)],hero.x-64,hero.y-64,0,1/3,1/2) 
end
function drawHeroWalkRight()
  love.graphics.draw(hero.walkRight[math.floor(hero.imgCurrent)],hero.x-64,hero.y-64,0,1/3,1/2) 
  hero.direction = 1

end
function drawHeroWalkLeft()
  love.graphics.draw(hero.walkLeft[math.floor(hero.imgCurrent)],hero.x-64,hero.y-64,0,1/3,1/2) 
  hero.direction = 0

  
end
function drawHerojump(pDirection)
  if pDirection == 1 then
  love.graphics.draw(hero.idleLeft[math.floor(hero.imgCurrent)],hero.x-64,hero.y-64,0,1/3,1/2) 
  else
    love.graphics.draw(hero.jump[math.floor(hero.imgCurrent)],hero.x-64,hero.y-64,0,1/3,1/2) 
  end
end

-------------Joueur 2--------------------------------------
function drawSprite2Mvt()
    if love.mouse.isDown(touche.SwordP2) then
      if hero2.direction == 0 then
        drawHero2AttackLeft()  
      else
        drawHero2AttackRight()  
      end
    elseif love.keyboard.isDown(touche.JumpP2) then
      if hero2.direction == 0 then
        drawHero2jump(1)
      else
        drawHero2jump(2)
      end  
    elseif love.keyboard.isDown(touche.AllerDroiteP2) then
      drawHero2WalkRight()
    elseif love.keyboard.isDown(touche.AllerGaucheP2) then
      drawHero2WalkLeft()
    else
      if hero2.direction == 0 then
        drawHero2IdleLeft()
      else
        drawHero2IdleRight()
      end
    end
end

function drawHero2IdleLeft()
  love.graphics.draw(hero2.idleLeft[math.floor(hero2.imgCurrent)],hero2.x-64,hero2.y-32,0,1/3,1/2.5) 
end
function drawHero2IdleRight()
  love.graphics.draw(hero2.idleRight[math.floor(hero2.imgCurrent)],hero2.x-64,hero2.y-32,0,1/3,1/2.5) 
end
function drawHero2WalkRight()
  love.graphics.draw(hero2.walkRight[math.floor(hero2.imgCurrent)],hero2.x-64,hero2.y-32,0,1/3,1/2.5) 
  hero2.direction = 1

end
function drawHero2WalkLeft()
  love.graphics.draw(hero2.walkLeft[math.floor(hero2.imgCurrent)],hero2.x-64,hero2.y-32,0,1/3,1/2.5) 
  hero2.direction = 0

  
end
function drawHero2jump(pDirection)
  if pDirection == 1 then
  love.graphics.draw(hero2.jumpRight[math.floor(hero2.imgCurrent)],hero2.x-64,hero2.y-32,0,1/3,1/2.5) 
  else
    love.graphics.draw(hero2.jump[math.floor(hero2.imgCurrent)],hero2.x-64,hero2.y-32,0,1/3,1/2.5) 
  end
end
function drawHero2AttackRight()
  love.graphics.draw(hero2.attackRight[math.floor(hero2.imgCurrentTimer)],hero2.x-64,hero2.y-64,0,1/3,1/2.5) 
end

function drawHero2AttackLeft()
  love.graphics.draw(hero2.attackLeft[math.floor(hero2.imgCurrentTimer)],hero2.x-64,hero2.y-64,0,1/3,1/2.5) 
end
----------- IA -----------------
function drawIA_mvt()
    if Etat == "Epé" then
      if hero2.direction == 0 then
        drawHero2AttackLeft()  
      else
        drawHero2AttackRight()  
      end
    elseif Etat == "Jump" then
      if hero2.direction == 0 then
        drawHero2jump(1)
      else
        drawHero2jump(2)
      end   
    elseif Etat == "AllerDroite" then
      drawHero2WalkRight()
    elseif Etat == "AllerGauche" then
      drawHero2WalkLeft()
    elseif Etat == "Attente" then
      if hero2.direction == 0 then
        drawHero2IdleLeft()
      else
        drawHero2IdleRight()
      end
    end
end
-----Restart----------------
function Restart()
  sequence[1] = "1.1.Depart"
  sequence[2] = "2.1.Depart"
  lifeBar.LifeRestant = 200
  lifeBar.LifeRestant2 = 200   
  hero.x = 20
  hero.y =  280     
  hero2.x = 850
  hero2.y =  280
end

-----Afficher le menu --------------
--------Particules pour le menu -----------------
local particle = {}
local liste_particles = {}
function Creeparticle(pX, pY, pType, pColor)
  
  particle = {}
  particle.x = pX
  particle.y = pY
  particle.type = pType
  particle.color = pColor
  
  table.insert(liste_particles, particle)
  return particle
  
end




function TraitementDesparticles(dt)
  
   local n
  -- traitement des particles
  for n=#liste_particles,1,-1 do
    local particle = liste_particles[n]
    particle.x = particle.x + 20 * dt
  if particle.type == 1 then
    particle.y = particle.y + 50 * dt
  elseif  particle.type == 2 then
    particle.y = particle.y + 100 * dt
  elseif  particle.type == 3 then
    particle.y = particle.y + 200 * dt
  end
    if particle.y > 900 then
        table.remove(liste_particles, n)      
    end
  end
end

function Updateparticle()
  
  if #liste_particles < 100 then
    x = math.random(1, largeur + 300)
    y = math.random(1, hauteur - 300 )
    Type = math.random(1,3)
    color =  math.random(0,255)
    Creeparticle(x,y,Type,color)
  end
end



function drawparticle()
         local n
  for n=1,#liste_particles do
    local t = liste_particles[n]
     love.graphics.setColor(t.color,t.color,t.color)
    if t.type == 1 then
      love.graphics.circle("fill",t.x, t.y,2)
    elseif t.type == 2 then
      love.graphics.circle("fill",t.x, t.y,5)
    elseif t.type == 3 then
      love.graphics.circle("fill",t.x, t.y,7)   
    end
     love.graphics.setColor(255,255,255)

  end
end 


--




local mapKnifeGame = {}

      mapKnifeGame[1]  =  { 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1 }    
      mapKnifeGame[2]  =  { 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1 }   
      mapKnifeGame[3]  =  { 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1 }
      mapKnifeGame[4]  =  { 0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1 }  
      mapKnifeGame[5]  =  { 0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1 }    
      mapKnifeGame[6]  =  { 0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1 }
      mapKnifeGame[7]  =  { 0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1 }    
      mapKnifeGame[8]  =  { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1 }    
      mapKnifeGame[9]  =  { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1 }    
      mapKnifeGame[10]  =  { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1 }    
      mapKnifeGame[11]  =  { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1 }    
      mapKnifeGame[12]  =  { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1 }    
      mapKnifeGame[13]  =  { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1 }    
      mapKnifeGame[14]  =  { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1 }    
      mapKnifeGame[15]  =  { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1 }    
      mapKnifeGame[16]  =  { 0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1 }    
      mapKnifeGame[17]  =  { 0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1 }    
      mapKnifeGame[18]  =  { 0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1 } 
      mapKnifeGame[19]  =  { 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1 }          
      mapKnifeGame[20]  =  { 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1 }    
      mapKnifeGame[21]  =  { 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1 }    


local JaugeKnife = love.graphics.newImage("img/knifeJauge.png")
local TargetImg = love.graphics.newImage("img/Cible2.png")
local KnifeGameMap = love.graphics.newImage("Map/knifeGame.png")
local direction = 1 
local ListeCible = {}
local Target = 10
local nombreDeCibles = 0
local levelKG = 1 
local targetSpeed = 200
local nombreDeKnife = 16
local restartKG = false
 
function knifeGameKeyPressed(key)
if love.keyboard.isDown("return") then
  if nombreDeCibles == 0 then
  x = math.random(8*32,25*32)
  y = math.random(3*32,17*32)
    
    CreeCible("Cible1",x,y)
  end
end
  
  
  
  if key == touche.TirP1 then
    nombreDeKnife = nombreDeKnife -1 
  end
  
  if key == "escape" then
    ecranCourant = "menu"
  end
end


  
function drawmapKnifeGame()
 love.graphics.draw(KnifeGameMap)
end

function CreeCible(pNom,pX,pY)
  cible = {}
  cible.x = pX
  cible.y = pY
  cible.Nom = love.graphics.newImage("img/"..pNom..".png")
  cible.l = cible.Nom:getWidth()
  cible.h = cible.Nom:getHeight()
  
  table.insert(ListeCible,cible)
  nombreDeCibles = nombreDeCibles + 1
  return cible
  
end
function drawTarget()
         local n
  for n=1,#ListeCible do
    local c = ListeCible[n]
    love.graphics.draw(c.Nom,c.x,c.y)   
  end
end 

function TraitementDesCibles(dt)
  -- traitement des cibles
  for n=#ListeCible,1,-1 do
    local cible = ListeCible[n]
    if cible.y < 96 then
      direction = 2
    elseif cible.y > 640 - 96 then
      direction = 1 
    end
    
    
    if direction == 1 then
      cible.y = cible.y - targetSpeed * dt 
    else
      cible.y = cible.y + targetSpeed * dt 
    end
    
    for i=#liste_tirs,1,-1 do
    local tir = liste_tirs[i]
      if colide(tir.x, tir.y, tir.l, tir.h,cible.x,cible.y,cible.h,cible.l) == true  then 
        nombreDeCibles = nombreDeCibles - 1
        Target = Target - 1 
        table.remove(ListeCible,n)
      end  
    end
    
    if restartKG == true then
       table.remove(ListeCible,n)
       restartKG = false
    end

   
  end
end

function DrawTargetLife()
  local i
  x = 250  
  for i=1,Target do
    
    x = x + 50
    love.graphics.draw(TargetImg,x,hauteur - 20)
  end
end











function knifeGameSprite_Update(dt)
    -------Deplacement-----------
  if love.keyboard.isDown(touche.AllerDroiteP1) then
      hero.x = hero.x + MoveSpeed * dt
  end
  if love.keyboard.isDown(touche.AllerGaucheP1) then
        hero.x = hero.x - MoveSpeed * dt
  end

   if love.keyboard.isDown(touche.AllerBasP1) then
        hero.y = hero.y + MoveSpeed * dt
  end
  
  
  knifeGameJumpUpdate(dt)
  --------Gravity-------------
  if Colide_DownKnifeGame() == true then
    hero.y = hero.y + Gravity
  end
  --------Rafréchissement des immages---------
  CurrendTimer1(dt)
  
  if hero.x > 7*32 then
    hero.x = 7*32
  end
  
  if hero.x < 4*32  then
    hero.x = 4*32 
  end

  if hero.y > 13*32 then
    hero.y = 13*32
  end
  
  
  
end

function knifeGameJumpUpdate(dt)
  -------------Vois si on peut sauter ou si on est dans le vide------------------
  if Colide_DownKnifeGame() ~= true then
    jumpReady = true
  else 
    jumpReady = false
  end
 ------------- Vitesse du saut et déplacement du perso pendant le saut--------------

  if hero_vx > 0 then
  --  if Colide_UpKnifeGame() == true then
    hero_vx = hero_vx -1.7
    hero.y =hero.y - (hero_vx - 2 )
    
  --  end
  end

  if Colide_UpKnifeGame() ~= true then
    hero_vx = 0
  end    
  
end

function Colide_UpKnifeGame()
  
  ligne = math.floor((hero.x/32) + 1.1)
  colonne = math.floor((hero.y/32) + 1.1)

     if mapKnifeGame[colonne][ligne] == 0 then 
      return true    
    end

end

function Colide_DownKnifeGame()
  ligne = math.floor((hero.x/32) + 1)
  colonne = math.floor((hero.y/32) + 1)

  if mapKnifeGame[colonne+2][ligne+1] == 0 then 
    return true    
  end

end
function TraitementDesTirsKnifeGame(dt)
   UpdateTir()
   coldownTir(dt)

    
   local n

  

  -- traitement des tirs
  for n=#liste_tirs,1,-1 do
    local tir = liste_tirs[n]
    tir.x = tir.x + tir.speed * dt
  
      ---------Colision joueur Tir !!!-------------------
  if tir.type == 2 then
    if colide(tir.x,tir.y,tir.l,tir.h,hero.x,hero.y,hero.l,hero.h) == true  then 
        tir.supprime = true
        table.remove(liste_tirs, n)   
      if lifeBar.LifeRestant > -1 then
      lifeBar.LifeRestant = lifeBar.LifeRestant - math.random(15,20)
      end
    end
  end
  if tir.type == 1 then
    if colide(tir.x,tir.y,tir.l,tir.h,hero2.x,hero2.y,hero2.l,hero2.h) == true  then 
        tir.supprime = true
        tir.x = -10000
        table.remove(liste_tirs, n)   
      if lifeBar.LifeRestant2 > -1 then
        lifeBar.LifeRestant2 = lifeBar.LifeRestant2 - math.random(15,20)
      end
    end
  end  
------------- Utile pour le mode Player vs IA ------------
  
    
    if Colide_TirKnifeGame() == true then            
      tir.supprime = true
      table.remove(liste_tirs, n)      
    end
  end
end

function Colide_TirKnifeGame()
  for n=1,#liste_tirs do
      local t = liste_tirs[n]
      ligne = math.floor((t.x/32) + 1)
      colonne = math.floor((t.y/32) + 1)
      vide = 0
    if mapKnifeGame[colonne][ligne] ~= 0 then 
        return true   
    end   
  end
end
function GererLesCibles()

  if nombreDeCibles == 0 then
    x = math.random(8*32,25*32)
    y = math.random(6*32,14*32) 
    
    CreeCible("Cible1",x,y)
  end
end
function knifeGameLevel()
  targetSpeed = 200 + 50 * levelKG
    if Target == 0 then 
      nombreDeKnife = 16
      Target = 10
      levelKG = levelKG +1
    end  
    
  if nombreDeKnife == - 1 then 
    ecranCourant = "GameOver"
  end
  
end
function drawJauge()
  love.graphics.setColor(180,60,60)
  love.graphics.rectangle("fill", 22, 37,nombreDeKnife * 13 , 22)
  if levelKG < 6 then
  love.graphics.setColor(100 + 25 * levelKG ,60,255)
  end
  love.graphics.draw(JaugeKnife,10,10)
  love.graphics.setFont(font)
  love.graphics.print("Level "..levelKG,100,15)
  love.graphics.setColor(255,255,255)
  love.graphics.setFont(fontpacifico)
  

  
end
function RestartKG()
  levelKG = 1
   direction = 1 
   Target = 10
   nombreDeCibles = 0
   levelKG = 1 
   targetSpeed = 200
   nombreDeKnife = 16
   restartKG = true
end








----------------------------------------------------------------------------------
function dessineChaineCouleur(pX,pY,pChaine)
    local rx = pX
    local ry = pY
    
    love.graphics.setColor(255,255,255)
    local i
    local ignore = 0
      for i=1,string.len(pChaine) do
        if ignore == 0 then                    
        local c = string.sub(pChaine,i,i)
        
        if c == "%" then
          ignore = 1
          local color = string.sub(pChaine,i+1,i+1)
          if color =="0" then   
            love.graphics.setColor(255,255,255)
          elseif color =="1" then    
            love.graphics.setColor(255,0,0)
          elseif color =="2" then    
            love.graphics.setColor(255,255,0)
          elseif color =="3" then    
            love.graphics.setColor(0,255,0)
          elseif color =="4" then    
            love.graphics.setColor(60,60,255)
          
        end
      else 
        love.graphics.print(c,rx,ry,0,2)
        rx = rx + _font:getWidth(c)
      end
    else 
      ignore = ignore -1 
    end
  end
end

---------------------Tout les menus ----------------------------------------------
--------------------Premier menu >>> Acceuil -------------------------------------
_font = love.graphics.newFont(70)
_menu = {}
_menu.x = largeur / 2 -150
_menu.y = hauteur / 2 -150
_menu.titre = "--%1Menu%0--" 
_menu.choix = {}
_menu.choix[1] = "[%3Games%0]"
_menu.choix[2] = "[%3Option%0]"
_menu.choix[3] = "[%4Exit  Game%0]"
_menu.selection = 1
function drawMenu()
  
  local PosY = _menu.y
  local hauteurLigne = _font:getHeight(30)
     
  dessineChaineCouleur(_menu.x + 25,_menu.y,_menu.titre)
        PosY = PosY + hauteurLigne

  
  
  local n
  local marque = ""
  for n= 1,#_menu.choix do 
    if _menu.selection == n then       
      marque = "%1**%0"
    else
      marque = "   "
    end
    dessineChaineCouleur(_menu.x - 100 ,PosY,marque.." ".._menu.choix[n])
      PosY = PosY + hauteurLigne
  end

end

function MenuKeyPressed(key)   
  if key == "down" then
    if _menu.selection < #_menu.choix  then
      _menu.selection = _menu.selection +1 
    else 
      _menu.selection = 1
    end
  end
    
  if key == "up" then
    if _menu.selection > 1  then
      _menu.selection = _menu.selection -1 
    else 
      _menu.selection =  #_menu.choix-- ( Le nombre de selection possible )  
    end
  end
   if key == "return" then
    if _menu.selection == 1 then
      ecranCourant = "games"
    elseif _menu.selection == 2 then
      ecranCourant = "option"
    elseif _menu.selection == 3 then
        love.event.quit()
    end
  end
end
-----Afficher les Jeux --------------
_font = love.graphics.newFont(70)
_Jeu = {}
_Jeu.titre = "--%1Choise Your  Game%0--" 
_Jeu.choix = {}
_Jeu.choix[1] = "[%3Player%0 Vs%3 Player%0]"
_Jeu.choix[2] = "[%3Player%0 Vs%3 IA%0]"
_Jeu.choix[3] = "[%3Knife Game%0]"
_Jeu.choix[4] = "[%3Avanture%0]"

_Jeu.choix[5] = "[%4Retour%0]"
_Jeu.selection = 1
function draw_Jeu()
  
  local PosY = _menu.y-100
  local hauteurLigne = _font:getHeight(30)
     
  dessineChaineCouleur(_menu.x -150,_menu.y-100,_Jeu.titre)
        PosY = PosY + hauteurLigne

  
  
  local n
  local marque = ""
  for n= 1,#_Jeu.choix do 
    if _Jeu.selection == n then       
      marque = "%1** %0"
    else
      marque = "   "
    end
    dessineChaineCouleur(_menu.x - 150 ,PosY,marque.." ".._Jeu.choix[n])
      PosY = PosY + hauteurLigne
    
  end

  




end

function _JeuKeyPressed(key)   
  if key == "escape" then
    ecranCourant = "menu"
  end
  
  if key == "down" then
    if _Jeu.selection < #_Jeu.choix  then
      _Jeu.selection = _Jeu.selection +1 
    else 
      _Jeu.selection = 1
    end
  end
    
  if key == "up" then
    if _Jeu.selection > 1  then
      _Jeu.selection = _Jeu.selection -1 
    else 
      _Jeu.selection =  #_Jeu.choix-- ( Le nombre de selection possible )  
    end
  end
   if key == "return" then
    if _Jeu.selection == 1 then
      Restart()
      ecranCourant = "jeu"
      Mode = 1
    elseif _Jeu.selection == 2 then
      ecranCourant = "difficulty"
    elseif _Jeu.selection == 3 then
      Mode = 3
      ecranCourant = "knifeGame"
    elseif _Jeu.selection == 4 then
      ecranCourant = "avanture"
    elseif _Jeu.selection == 5 then
      ecranCourant = "menu"
    end
  end
end

-----Afficher les option --------------
_Option = {}
_Option.titre = "--%1Option%0--" 
_Option.choix = {}
_Option.choix[1] = "[%3Controls%0]"
_Option.choix[2] = "[%4Back%0]"
_Option.selection = 1
function drawOption()
  
  local PosY = _menu.y
  local hauteurLigne = _font:getHeight(20)
     
  dessineChaineCouleur(_menu.x,_menu.y,_Option.titre)
        PosY = PosY + hauteurLigne

  
  
  local n
  local marque = ""
  for n= 1,#_Option.choix do 
    if _Option.selection == n then       
      marque = "%1** %0"
    else
      marque = "   "
    end
    dessineChaineCouleur(_menu.x - 100, PosY,marque.." ".._Option.choix[n])
      PosY = PosY + hauteurLigne
    
  end

  




end

function OptionKeyPressed(key)   
  if key == "escape" then
   ecranCourant = "menu"
  end
 
 
 if key == "down" then
    if _Option.selection < #_Option.choix  then
      _Option.selection = _Option.selection +1 
    else 
      _Option.selection = 1
    end
  end
    
  if key == "up" then
    if _Option.selection > 1  then
      _Option.selection = _Option.selection -1 
    else 
      _Option.selection =  #_Option.choix-- ( Le nombre de selection possible )  
    end
  end
   if key == "return" then
    if _Option.selection == 1 then
      ecranCourant = "touche" 
    elseif _Option.selection == 2 then
      ecranCourant = "menu"
    end
  end
end





------------ Difficulté de l'IA --------------
Difficulty = {}
Difficulty.titre = "--%1Difficulty%0--" 
Difficulty.choix = {}
Difficulty.choix[1] = "[%3Easy%0]"
Difficulty.choix[2] = "[%1Normal%0]"
Difficulty.choix[3] = "[%3Hard%0]"
Difficulty.choix[4] = "[%4Back%0]"
Difficulty.selection = 2
function drawDifficulty()
  
  local PosY = _menu.y
  local hauteurLigne = _font:getHeight(20)
     
  dessineChaineCouleur(_menu.x,_menu.y,Difficulty.titre)
        PosY = PosY + hauteurLigne

  
  
  local n
  local marque = ""
  for n= 1,#Difficulty.choix do 
    if Difficulty.selection == n then       
      marque = "%1** %0"
    else
      marque = "   "
    end
    
      dessineChaineCouleur(_menu.x,PosY,marque.." "..Difficulty.choix[n])
      PosY = PosY + hauteurLigne

  end





end

function DifficultyKeyPressed(key)
  if key == "escape" then
    ecranCourant = "games"
  end
    
  if key == "down" then
    if Difficulty.selection < #Difficulty.choix  then
      Difficulty.selection = Difficulty.selection +1 
    else 
      Difficulty.selection = 1
    end
  end
    
  if key == "up" then
    if Difficulty.selection > 1  then
      Difficulty.selection = Difficulty.selection -1 
    else 
      Difficulty.selection =  #Difficulty.choix-- ( Le nombre de selection possible )  
    end
  end
   if key == "return" then
        if Difficulty.selection == 1 then
        hero2.coldownTir = 1.5
        hero.coldownTir = 2.5
        
        Difficulty.choix[1] = "[%1Easy%0]"
        Difficulty.choix[2] = "[%3Normal%0]"
        Difficulty.choix[3] = "[%3Hard%0]"
        
        Restart()
        ecranCourant = "playerVsIA"
        Mode = 2
      elseif Difficulty.selection == 2 then
        hero2.coldownTir = 2
        hero.coldownTir = 2
        
        Difficulty.choix[1] = "[%3Easy%0]"
        Difficulty.choix[2] = "[%1Normal%0]"
        Difficulty.choix[3] = "[%3Hard%0]"
          
        Restart()
        ecranCourant = "playerVsIA"
        Mode = 2
      elseif Difficulty.selection == 3 then
        hero2.coldownTir = 3
        hero.coldownTir = 1
        
        Difficulty.choix[1] = "[%3Easy%0]"
        Difficulty.choix[2] = "[%3Normal%0]"
        Difficulty.choix[3] = "[%1Hard%0]"
        
        Restart()
        ecranCourant = "playerVsIA"
        Mode = 2
      elseif Difficulty.selection == 4 then
        ecranCourant = "games"
    end
  end
end







----------- Ecran de Fin de partie --------------- 


GameOver = {}
GameOver.titre = "--%1Game   Over %0--" 
GameOver.choix = {}
GameOver.choix[1] = "[%4Return To Menu%0]"
GameOver.choix[2] = "[%2Restart%0]"

GameOver.selection = 1
function drawGameOver()
  
  local PosY = _menu.y
  local hauteurLigne = _font:getHeight(20)
     
  dessineChaineCouleur(_menu.x-50,_menu.y,GameOver.titre)
        PosY = PosY + hauteurLigne

  
  
  local n
  local marque = ""
  for n= 1,#GameOver.choix do 
    if GameOver.selection == n then       
      marque = "%1** %0"
    else
      marque = "   "
    end
    dessineChaineCouleur(_menu.x - 150,PosY,marque.." "..GameOver.choix[n])
      PosY = PosY + hauteurLigne
    
  end
end

function GameOverKeyPressed(key)   
  if key == "down" then
    if GameOver.selection < #GameOver.choix  then
      GameOver.selection = GameOver.selection +1 
    else 
      GameOver.selection = 1
    end
  end
    
  if key == "up" then
    if GameOver.selection > 1  then
      GameOver.selection = GameOver.selection -1 
    else 
      GameOver.selection =  #GameOver.choix-- ( Le nombre de selection possible )  
    end
  end
   if key == "return" then
    if GameOver.selection == 1 then
      ecranCourant = "menu"
    elseif GameOver.selection == 2 then
        if Mode == 1 then
          Restart()
          Mode = 2
          ecranCourant = "jeu"
        elseif Mode == 2 then
          ecranCourant = "playerVsIA"
          Restart()
          Mode = 2
        elseif Mode == 3 then
          RestartKG()
          ecranCourant = "knifeGame"
        end
    end
  end
end

--------Option des Controls ----------



Touches = {}
Touches.titre = "--%1Touches%0--" 
Touches.choix = {}
Touches.x = largeur / 2 -150
Touches.y = hauteur / 2 -150
Touches.choix[1] = "[%1 Player 1 %0]"
Touches.choix[2] = "[%3 Shoot  : "..touche.TirP1.."%0]"
Touches.choix[3] = "[%3 Left : "..touche.AllerGaucheP1.."%0]"
Touches.choix[4] = "[%3 Right: "..touche.AllerDroiteP1.."%0]"
Touches.choix[5] = "[%3 Down: "..touche.AllerBasP1.."%0]"
Touches.choix[6] = "[%3 Jump : "..touche.JumpP1.."%0]"
Touches.choix[7] = "[%3 Sword : "..touche.SwordP1.."%0]"

Touches.choix[8] = "[%1 Player 2 %0]"
Touches.choix[9] = "[%3 Shoot  : "..touche.TirP2.."%0]"
Touches.choix[10] = "[%3 Left : "..touche.AllerGaucheP2.."%0]"
Touches.choix[11] = "[%3 Right: "..touche.AllerDroiteP2.."%0]"
Touches.choix[12] = "[%3 Down: "..touche.AllerBasP2.."%0]"
Touches.choix[13] = "[%3 J  ump : "..touche.JumpP2.."%0]"
Touches.choix[14] = "[%3 Sword : "..touche.SwordP2.."%0]"
Touches.selection = 2
function drawTouches()
  
  local PosY = Touches.y
  local hauteurLigne = _font:getHeight(20)
     
  dessineChaineCouleur(Touches.x-50,Touches.y,Touches.titre)
        PosY = PosY + hauteurLigne

  
  
  local n
  local marque = ""
  for n= 1,#Touches.choix do 
    if Touches.selection == n then       
      marque = "%1** %0"
    else
      marque = "   "
    end
    dessineChaineCouleur(Touches.x - 150,PosY,marque.." "..Touches.choix[n])
      PosY = PosY + hauteurLigne
    
  end
end

function TouchesKeyPressed(key)   
  if key == "escape" then
    ecranCourant = "option"
  end
  
  if key == "down" then    
    if Touches.selection < #Touches.choix  then
      Touches.y = Touches.y - 80
      Touches.selection = Touches.selection +1 
    end
  end
    
  if key == "up" then
    if Touches.selection > 1  then
      Touches.y = Touches.y + 80
      Touches.selection = Touches.selection -1 
    end
  end
  
  
  
   if key == "return" then
    if Touches.selection == 2 then 
    elseif Touches.selection == 3 then      
    elseif Touches.selection == 4 then      
    elseif Touches.selection == 5 then      
    elseif Touches.selection == 6 then
    elseif Touches.selection == 7 then ----------Changement de touches a faires plus tard
    elseif Touches.selection == 9 then
    elseif Touches.selection == 10 then
    elseif Touches.selection == 11 then
    elseif Touches.selection == 12 then
    elseif Touches.selection == 13 then
    elseif Touches.selection == 14 then
    end
  end
end









