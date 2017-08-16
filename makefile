###############################################################
# Program:
#     Milestone 08, Skeet
#     Brother Comeau, CS165
# Author:
#     Avery Reed
# Summary:
#     Put your summary code here... 
# Above and Beyond
#     When you submit your final project (not for milestones),
#     list anything here that you did to go above and beyond
#     the base requirements for your project.
###############################################################


LFLAGS = -lglut -lGLU -lGL

###############################################################
# Build the main game
###############################################################
a.out: driver.o game.o uiInteract.o uiDraw.o point.o rifle.o bullet.o flyingObject.o velocity.o bird.o
	g++ driver.o game.o uiInteract.o uiDraw.o point.o rifle.o bullet.o flyingObject.o velocity.o bird.o $(LFLAGS)

###############################################################
# Individual files
#    uiDraw.o      Draw polygons on the screen and do all OpenGL graphics
#    uiInteract.o  Handles input events
#    point.o       The position on the screen
#    ground.o      Handles the ground / world
#    game.o        Handles the game interaction
###############################################################
uiDraw.o: uiDraw.cpp uiDraw.h point.h
	g++ -c uiDraw.cpp

uiInteract.o: uiInteract.cpp uiInteract.h
	g++ -c uiInteract.cpp

point.o: point.cpp point.h
	g++ -c point.cpp

game.o: game.cpp uiDraw.h uiInteract.h point.h rifle.h bullet.h bird.h
	g++ -c game.cpp

driver.o: game.h uiInteract.h driver.cpp
	g++ -c driver.cpp

rifle.o: rifle.h point.h uiDraw.h rifle.cpp
	g++ -c rifle.cpp

#######################################################################
# ADD YOUR ADDITIONAL RULES HERE!
#
# Then, don't forget to add them to the dependecy list for a.out above.
#######################################################################

bullet.o: bullet.h point.h flyingObject.h uiDraw.h
	g++ -c bullet.cpp

flyingObject.o: flyingObject.h point.h velocity.h
	g++ -c flyingObject.cpp

velocity.o: velocity.h
	g++ -c velocity.cpp

bird.o: bird.h flyingObject.h uiDraw.h
	g++ -c bird.cpp

###############################################################
# General rules
###############################################################
clean:
	rm a.out *.o
