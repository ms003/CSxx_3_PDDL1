(define (domain PlayRobot)
    (:requirements:typing)
    (:types room robby keys car box gripper position)
    (:predicates 
        (neighbour ?from ?to -room)
        (at-robby ?rob -robby ?r -room) 
        (free ?g -gripper)
        (carry-keys ?k -keys ?g -gripper)
        (in-robby ?rob -robby ?c -car)
        (in-keys ?k -keys ?c -car)
        (in-box ?b -box ?c -car)
        (carry-box ?b -box ?g -gripper)
        (at-keys ?k -keys ?r -room)
        (at-car ?c -car ?r -room)
        (at-box ?b -box ?r -room)
        (at ?r -room ?p1 -position)

    )   
        
        
         
        
    
    (:action move
        :parameters (?rob -robby ?from ?to -room)
        :precondition (and (at-robby ?rob ?from)
        (neighbour ?from ?to))
        :effect (and (at-robby ?rob ?to) (not (at-robby ?rob ?from))))
    

    
    (:action pickupkey
        :parameters (?k -keys ?r -room  ?g  -gripper ?rob -robby)
        :precondition (and (at-keys ?k ?r) (at-robby ?rob ?r) (free ?g))
        :effect (and (carry-keys ?k ?g) (not (at-keys ?k ?r)) (not (free ?g)) ))
        
            
    (:action getincar
        :parameters (?c -car ?k -keys ?r -room ?rob -robby ?g -gripper)
        :precondition (and (at-robby ?rob ?r)(carry-keys ?k ?g) (at-car ?c ?r) (not(free ?g)))
        :effect (and(in-robby ?rob ?c) (not(at-robby ?rob ?r)) (in-keys ?k ?c) (not (carry-keys ?k ?g)) (free ?g)))
    
    (:action drive
        :parameters (?c -car ?rob -robby ?from ?to -room  ?k -keys)
        :precondition (and (in-robby ?rob ?c) (in-keys ?k ?c) (at-car ?c ?from ) (neighbour ?from ?to))
        :effect (and (at-car ?c ?to ) (not (at-car ?c ?from ))))
        
 
        
    (:action getoutofcar
        :parameters (?r -room  ?rob -robby ?c -car)
        :precondition (and (in-robby ?rob ?c) (at-car ?c ?r))
        :effect (and (at-robby ?rob ?r) (not(in-robby ?rob ?c)) ))
    
    (:action pickupbox
        :parameters (?b -box ?r -room ?rob -robby ?c -car ?g -gripper)
        :precondition (and (at-robby ?rob ?r) (at-box ?b ?r) (free ?g) (at-car ?c ?r)) 
        :effect (and  (carry-box ?b ?g) (not(at-box ?b ?r)) (in-box ?b ?c) (not(free ?g)) ))
   
            
    (:action dropoffbox
        :parameters (?c -car ?b -box ?rob -robby ?g -gripper ?r -room)
        :precondition (and(in-box ?b ?c) (at-car ?c ?r) (at-robby ?rob ?r) (not(free ?g)))
        :effect (and (not(in-box ?b ?c)) (at-box ?b ?r) (free ?g)))
    
    (:action getincar
        :parameters (?c -car ?rob -robby ?r -room )
        :precondition (and (at-robby ?rob ?r ) (at-car ?c ?r ))
        :effect (and (in-robby ?rob ?c) (not(at-robby ?rob ?r)) ))
        
    (:action dropoffcar
        :parameters (?c -car ?rob -robby ?k -keys ?r -room ?g -gripper)
        :precondition (and (in-keys ?k ?c) (in-robby ?rob ?c) (at-car ?c ?r) ( free ?g))
        :effect (and (carry-keys ?k ?g) (not(in-keys ?k ?c)) (not(free ?g)) ))
    
    (:action dropoffkey
        :parameters (?k -keys ?rob -robby ?r -room ?g -gripper)
        :precondition (and (carry-keys ?k ?g) (at-robby ?rob ?r) (not(free ?g)))
        :effect (and (at-keys ?k ?r) (at-robby ?rob ?r) (free ?g) (not(carry-keys ?k ?g))))
    
    
)