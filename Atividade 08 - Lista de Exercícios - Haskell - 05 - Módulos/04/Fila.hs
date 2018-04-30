module Fila (Fila (Queue), emptyQueue, enqueue, dequeue, first) where

data Fila t = Queue [t]
    deriving (Eq,Show)

enqueue :: Fila t -> t -> Fila t
enqueue (Queue s) x = Queue (x:s)

dequeue :: Fila t -> Fila t
dequeue (Queue []) = error "Empty"
dequeue (Queue (x:[])) = emptyQueue
dequeue (Queue (x:s)) = enqueue (dequeue (Queue s)) x

first :: Fila t -> t
first (Queue []) = error "Empty"
first (Queue (x:[])) = x
first (Queue (x:s)) = first (Queue s)

emptyQueue :: Fila t
emptyQueue = Queue []
