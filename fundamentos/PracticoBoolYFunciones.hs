--Ej 9:(∀b1,b2,b3::Bool) b1 && (b2 || b3) = (b1 && b2) || (b1 && b3)
--Dem: por casos en b1:: Bool

-- Caso 1) b1= True: (∀ b2::Bool, b3::Bool) True && (b2 || b3) = (True && b2) || (True && b3)

--True && (b2 || b3)
-- =def &&, Bx2, case
-- (b2 || b3)
-------------------------
-- (True && b2)
-- =def &&, Bx2, case
--b2 || (True && b3)
-- def &&, Bx2, case
-- b2 || b3
--
--RME.
--
--Caso 2) b1=False: (∀ b2::Bool, b3::Bool) False && (b2 || b3) = (False && b2) || (False && b3)
--
--False && (b2 || b3) 
-- =def &&, Bx2, case
--False
-----------------------
-- (False && b2) || (False && b3)
-- =def &&x2 , Bx4, casex2
-- False || False
-- =def ||, Bx2, case
-- False
--
--RME.
--
--
--
-
--
--
--
--
--
--
--
--
--
--
--
--
--