# proper interview code challenge

## The problem

Requirements:

Task 1: Coding Challenge
Write a program that downloads the images from I Can Has Cheezburger? and stores them locally. Only download graphics
that are memes on the page and not sponsored content.
Enable the above program to run on multiple threads. With an additional Parameter sent as `threads` that is a number
between 1 and 5, parallelize the process while continuing to support the `amount` flag.

The Task:
Your program should support several parameters. amount determines how many images should be downloaded.
Additionally, enable the above program to run on multiple threads. With an additional parameter sent as threads that is a
number between 1 and 5, parallelize the process while continuing to support the amount flag.

Addition Considerations
In the test plan and setup:
 - Choose the language of your choice
 - Choose a framework of your choice if applicable. You don’t have to use any if you choose not to.

Final Deliverables:
 - Present this work via sharing your screen in the panel interview.
 - Plan to take between 10 - 20 minutes for this section of your presentation, with a few minutes for Q&A


## The solution
Using Ruby on Rails, with some basic JS, SCSS, Bootstrap and jQuery, with only a handful of added gems, I created an elegant solution to the proposed challenge.

Using a simple page, we can process and administer the requested images downloads, setting up the `amount` and `threads` variables.

Attaching some screens to help visualize how this looks and feels, also how it works.

## Administration
![Screenshot 2023-03-03 at 20 56 46](https://user-images.githubusercontent.com/361355/222857018-4180fddf-bb80-43c6-9351-508014455f7d.png)

## Showing the downloaded images
![Screenshot 2023-03-03 at 20 57 54](https://user-images.githubusercontent.com/361355/222857094-034b7917-de74-4f14-b21a-ff625bc80fcf.png)

## Notifications area
![Screenshot 2023-03-03 at 20 58 13](https://user-images.githubusercontent.com/361355/222857138-ed3bcaf0-3af9-440b-98d6-509fd94f91df.png)

## Functionality
### Download Images
### Remove all Images
### Remove one Image
### Show all the Images 
### Set the Amount of images to download
### Set the Threads to be executed on parallel

