{-#LANGUAGE GADTs#-}
{-# OPTIONS_GHC -fno-warn-tabs #-}

import Prelude (Show)

data Bool where { True :: Bool; False :: Bool }

nand :: Bool -> Bool -> Bool
nand = \a -> \b -> case a of
    True  -> not b
    False -> True

nor :: Bool -> Bool -> Bool
nor = \a -> \b -> case a of
    True  -> False
    False -> not b

not :: Bool -> Bool
not = \a -> case a of
    True  -> False
    False -> True

-- (∀b1::Bool) not b1 = nor b1 b1
-- dem: por casos en b1::Bool
--     caso 1) b1 = True: not True = nor True True
--         not True
--         = def not, B, case
--         False
--         --------
--         nor True True
--         = def nor, Bx2, case
--         False
--     RME.
--     caso 2) b1 = False: not False = nor False False
--         not False
--         = def not, B, case
--         True
--         --------
--         nor False False
--         = def nor, Bx2, case
--         not False
--         = def not, B, case
--         True
--     RME.

(||) :: Bool -> Bool -> Bool
(||) = \a -> \b -> case a of
    True  -> True
    False -> b

-- (∀b1,b2::Bool) b1 || b2 = not (nor b1 b2)
-- dem: por casos en b1::Bool
--     caso 1) b1 = True: (∀b2::Bool) True || b2 = not (nor True b2)
--         True || b2
--         = def ||, Bx2, case
--         True
--         -------------------
--         not (nor True b2)
--         = def nor, Bx2, case
--         not False
--         = def not, B, case
--         True
--     RME.
--     caso 2) b1 = False: (∀b2::Bool) False || b2 = not (nor False b2)
--         False || b2
--         = def ||, Bx2, case
--         b2
--         -------------------
--         not (nor False b2)
--         = def nor, Bx2, case
--         not (not b2)
--         = Lnot
--         b2

-- Lnot: (∀b::Bool) not (not b) = b. demostrado en clase