# Simple web Python application

This application uses **[flask framework](https://flask.palletsprojects.com/en/2.0.x/)** and is building with the pyinstaller and staticx tools, which allow it to run as a standalone application without an interpreter.
To build use the custom **[python builder](https://hub.docker.com/layers/159379567/privetkakdela/devops_course/python_builder/images/sha256-0e06bcb4775030a27d6893093a732bce05d1a28e6d5908b376fd93198009e0b3?context=repo)** with all the required libraries installed, which makes the builder as standalone.
And the app is packaging into a docker container.

# How use?

Clone repo, install **```docker```** and run **```docker build -t app_py .```**  
Run docker conteiner **```docker run -d -p 8080:8080 --name app_py app_py```**  
Check result **```http://yours_ip:8080```**

### Result:
![app_py](/pic/res.png)