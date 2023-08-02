# final_year_project
 Sales forecasting system
 INSTALLATION
# Step 1 
Install Node.js.
Download and install Node.js from the website:  https://nodejs.org/
# Step 2
Install Pyhton
Download and install Python from the official website: https://www.python.org/

# Step 3
Download the zipped folder containing the project from the github link below
https://github.com/Iprogrammer26/Supermarket-Sales-Forecasting-System.git

# Step 4
Export the supermarket.sql database in the zipped folder to your local server
# Step 3
Set up the python environment
Create a new virtual environment  to isolate Python dependencies for this project:
In the command prompt, navigate to the directory where you have saved the project using cd your_path to the directory with the project then run the commands below
# On Windows
python -m venv env

# On macOS and Linux
python3 -m venv env

Activate the virtual environment:
# On Windows
env\Scripts\activate

# On macOS and Linux
source env/bin/activate
# Step 4
Install Necessary Python Dependencies:
Run the commands below:
pip install scikit-learn
python -c "import sklearn"
pip install mysql-connector-python
python -c "import sqlalchemy"
pip install pandas
pip install numpy

# Step 5
Set Up Node.js Dependencies on the Deployment Server
install the node.js dependencies using the command below
npm install
# Step 6
Configure the Deployment Server
Set up the database on the deployment server and update the database configuration in the db_config.json file to match those of your server.
# Step 7
Run the Application
Activate the Python virtual environment on the deployment server by running the command below
# On Windows
env\Scripts\activate

# On macOS and Linux
source env/bin/activate

# Start the Node.js server:
Run the command below
node app.js
The system will now be accessible at 
http://localhost:5000/

## SYSTEM BLOG
Blog site
https://sites.google.com/view/bse23-32systemblog?usp=sharing
