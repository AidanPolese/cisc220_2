#!/bin/bash
#Manvir Grewal : 10193283
#Aiden Polese : 10197342
#Kathleen Abols : 10179548
#lists process hierarchy - parents/children associated 
#command satisfies the requirements of the assignment
#didn't have time to manually create a recursive/iterative function

ps axo comm,pid,ppid,start,user --forest
	
