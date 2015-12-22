##READ ME

	
#NORMALIZE							
1. --------->	convertImagesTo64.m					
								
	Normalize images with the names corresponding to the student names	
	in "namesHorizontal" and "namesVertical" (because some are 320*240 	
	and some 240*320). The images of every student in the same text file	
	must have the same size.  					

#INITIALIZE
2. --------->initRecognition						
								
	Read the training and test images, get the feature vectors from the 	
	training images, and split the training images in groups of males and	
	females.							

#SHOW RESULTS
------------>findCorrFaceAndGender.m					
								
	Input the number of the image you want to test and it returns the 	
	corresponding training image, if the face recognition is correct or not,	
	and what is the gender of the test image.				


------------>getAccuracy.m						
								
	Get the Accuracy of the face recognition computing the corresponding	
	training image for every test image. The accuracy is computed for the 	
	k principal elements computed in the initRecognition.m.		


------------>getGenderOfAll.m						
							
	Get the gender of all images and display the images of all students in 	
	the female group. You can modify the number k of nearest neighbors	
	taken.							


------------>getAccuracyAccordingK.m					
								
	Get the graph of  the accuracy according numbers k of principal elements	
	going from 10 to 1000. (can take a while)				

