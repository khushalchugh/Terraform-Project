# Terraform-Project

This is a project I created to showcase my knowledge in using the components of aws in Terraform with the help of modules.

file:///home/khushal/Documents/tf/Terraform%20Project/Architecture.png![image](https://user-images.githubusercontent.com/112554837/218684208-b51cd6a2-3daf-4207-b919-06459547c503.png)

Commands:

First of all, you should download the providers using:

~terraform init

Note: This might take a few minutes

Once the providers are downloaded. You can do:

~terraform plan

This will show you what components are going to be created with aws

If you are satisfied with the list, type:

~terraform apply

This will again show you the list of components and a prompt will appear, type:

~yes (in prompt) or any other key discard the changes

This will start creating the components. The process should take about 10 minutes. 

If you wish to revert back to the previous state and destroy all the components. You can do:

~terraform destroy

This will again ask for a prompt, type:

~yes (in prompt) or any other key discard the changes





