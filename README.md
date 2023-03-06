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
![Screenshot 2023-03-06 at 17 03 00](https://user-images.githubusercontent.com/361355/223218734-b416af20-8028-4f01-b951-024be09f5315.png)

## Showing the downloaded images
![Screenshot 2023-03-06 at 17 05 59](https://user-images.githubusercontent.com/361355/223218852-07222f6d-ecd5-4520-b4c4-fe9cd4c915a2.png)

## Notifications area
![Screenshot 2023-03-06 at 17 06 42](https://user-images.githubusercontent.com/361355/223218977-138c9c41-5afc-46bf-886c-537bda8e84f8.png)
![Screenshot 2023-03-06 at 17 06 35](https://user-images.githubusercontent.com/361355/223218982-49a86942-e21d-4b72-827b-dff36c9f0e34.png)


## Functionality and further Information
- Download Images
- Remove all Images
- Remove one Image
- Show all the Images
- Show image description
- Show image download date
- Show total images download
- Set the Amount of images to download
- Set the Threads to be executed on parallel

