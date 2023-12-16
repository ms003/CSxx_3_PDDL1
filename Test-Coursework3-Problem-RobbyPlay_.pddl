(define (problem PlayRobot)
    (:domain PlayRobot)
    (:objects G1 G2 G3 G4 G5 G6 G7 G8 G9 G10 -room
        top1 top2 top3 bot1 bot2 centr1 centr2 centr3 centr4 centr5 -position
        Keys -keys Car -car Box -box  Robby -robby Gripper -gripper)
    (:init
    
        (at-robby Robby G1) 
        (at-car Car G3)
        (at-box Box G6)
        (at-keys Keys G4)
        (at G1 centr1)
        (at G2 centr2)
        (at G5 centr3)
        (at G7 centr4)
        (at G8 centr5)
        (at G4 top1)
        (at G9 top2)
        (at G10 top3)
        (at G3 bot1)
        (at G6 bot2)
        (free Gripper)
        
        (neighbour G1 G2) (neighbour G2 G1)
        (neighbour G2 G4) (neighbour G4 G2) (neighbour G2 G3) (neighbour G3 G2) (neighbour G2 G5)(neighbour G5 G2)
        (neighbour G5 G6) (neighbour G6 G5) (neighbour G5 G7) (neighbour G7 G5) 
        (neighbour G7 G8) (neighbour G8 G7) (neighbour G7 G9) (neighbour G9 G7)
        (neighbour G9 G10) (neighbour G10 G9)
        
        )
    (:goal (and(at-box Box G10)
            (at-car Car G3)
            (at-keys Keys G4)
            (at-robby Robby G1)   )
       
     

        
    )
    )
        