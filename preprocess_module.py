import sys
import mysql.connector
import pandas as pd
import joblib
from sklearn.preprocessing import LabelEncoder
from sqlalchemy import create_engine
import json

def load_model(subcategory):
    model_file = {
        'Cakes': './models/cakes_model.pkl',
        'Cookies': './models/cookies_model.pkl',
        'Eggs': './models/eggs_model.pkl',
        'Rice': './models/rice_model.pkl',
        'SoftDrinks': './models/soft_drinks_model.pkl'
    }
    model_path = model_file.get(subcategory)
    if model_path:
        return joblib.load(model_path)
    else:
        raise ValueError(f"No model found for subcategory '{subcategory}'.")

def preprocess_data(data):
    # Convert 'orderDate' to datetime
    data['orderDate'] = pd.to_datetime(data['orderDate'])

    # Label Encoding for 'Category' and 'SubCategory' (assuming they are ordinal)
    label_encoder = LabelEncoder()
    data['Category_LabelEncoded'] = label_encoder.fit_transform(data['Category'])
    data['Sub Category_LabelEncoded'] = label_encoder.fit_transform(data['SubCategory'])

    # Resample data to days, weeks, and months
    daily_data = data.groupby(pd.Grouper(key='orderDate', freq='D')).agg({
        'Sales': 'sum',
        'Discount': 'sum',   # Use 'sum' for Discount column
        'Profit': 'sum',     # Use 'sum' for Profit column

        'Category': 'first',
        'SubCategory': 'first',
        'Category_LabelEncoded': 'first',           # Include encoded columns in daily_data
        'Sub Category_LabelEncoded': 'first'        # Include encoded columns in daily_data
    }).reset_index()

    weekly_data = data.groupby(pd.Grouper(key='orderDate', freq='W')).agg({
        'Sales': 'sum',
        'Discount': 'sum',   # Use 'sum' for Discount column
        'Profit': 'sum',     # Use 'sum' for Profit column

        'Category': 'first',
        'SubCategory': 'first',
        'Category_LabelEncoded': 'first',           # Include encoded columns in weekly_data
        'Sub Category_LabelEncoded': 'first'        # Include encoded columns in weekly_data
    }).reset_index()

    monthly_data = data.groupby(pd.Grouper(key='orderDate', freq='M')).agg({
        'Sales': 'sum',
        'Discount': 'sum',   # Use 'sum' for Discount column
        'Profit': 'sum',     # Use 'sum' for Profit column

        'Category': 'first',
        'SubCategory': 'first',
        'Category_LabelEncoded': 'first',           # Include encoded columns in monthly_data
        'Sub Category_LabelEncoded': 'first'        # Include encoded columns in monthly_data
    }).reset_index()

    # Fill any missing values with 0
    daily_data.fillna(0, inplace=True)
    weekly_data.fillna(0, inplace=True)
    monthly_data.fillna(0, inplace=True)

    daily_data.set_index('orderDate', inplace=True)
    weekly_data.set_index('orderDate', inplace=True)
    monthly_data.set_index('orderDate', inplace=True)

    # Create lag features for the target column (Sales)
    def create_lag_features(data, target_column, lag=1):
        data_copy = data.copy()
        for i in range(1, lag + 1):
            data_copy[f"{target_column}_lag_{i}"] = data_copy[target_column].shift(i)
        return data_copy

    # Define the number of days you want to forecast (3 days in this case)
    forecast_days = 3

    # Create lag features for the target column (Sales)
    daily_data_lagged = create_lag_features(daily_data, "Sales", forecast_days)
    weekly_data_lagged = create_lag_features(weekly_data, "Sales", forecast_days)
    monthly_data_lagged = create_lag_features(monthly_data, "Sales", forecast_days)

    # Drop rows with NaN values (due to lag creation)
    daily_data_lagged = daily_data_lagged.dropna()
    weekly_data_lagged = weekly_data_lagged.dropna()
    monthly_data_lagged = monthly_data_lagged.dropna()

    # Separate the features (X) and the target (y)
    columns_to_drop = ["Sales", "Category", "SubCategory"]
    X_daily = daily_data_lagged.drop(columns_to_drop, axis=1)
    X_weekly = weekly_data_lagged.drop(columns_to_drop, axis=1)
    X_monthly = monthly_data_lagged.drop(columns_to_drop, axis=1)

    return X_daily, X_weekly, X_monthly

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python script.py <SubCategory> <period>")
        sys.exit(1)

    subcategory = sys.argv[1]
    period = sys.argv[2]

    try:
        # Connect to the database using SQLAlchemy
        conn_string = 'mysql+mysqlconnector://root:@localhost/supermarket'
        engine = create_engine(conn_string)

        # Assuming your data table is named 'salesdata'
        start_date, end_date = sys.argv[2].split(" to ")
        query = f"SELECT Discount, Profit, Sales, Category, SubCategory, `orderDate` FROM salesdata WHERE SubCategory = '{subcategory}' AND orderDate BETWEEN '{start_date}' AND '{end_date}';"

        # Use the SQLAlchemy connection to read data from the database
        new_data_df = pd.read_sql(query, con=engine)

        # Load the model
        loaded_model = load_model(subcategory)

        # Preprocess the new data
        X_daily, X_weekly, X_monthly = preprocess_data(new_data_df)

        # Make predictions for the next 3 days, weeks, and months using the new data
        forecast_features_daily = X_daily.tail(-3).copy()
        forecast_features_weekly = X_weekly.tail(-3).copy()
        forecast_features_monthly = X_monthly.tail(-3).copy()

        # List to store the predictions for the next 3 days, weeks, and months
        predictions_daily = []
        predictions_weekly = []
        predictions_monthly = []

        # Perform the forecasting for the next 3 days, weeks, and months
        for i in range(3):
            # Make the prediction for the next day using the current features (daily)
            prediction_daily = loaded_model.predict(forecast_features_daily)
            predictions_daily.append(float(prediction_daily[0]))
            forecast_features_daily = forecast_features_daily.shift(-1).fillna(prediction_daily[0])

            # Make the prediction for the next week using the current features (weekly)
            prediction_weekly = loaded_model.predict(forecast_features_weekly)
            predictions_weekly.append(float(prediction_weekly[0]))
            forecast_features_weekly = forecast_features_weekly.shift(-1).fillna(prediction_weekly[0])

            # Make the prediction for the next month using the current features (monthly)
            prediction_monthly = loaded_model.predict(forecast_features_monthly)
            predictions_monthly.append(float(prediction_monthly[0]))
            forecast_features_monthly = forecast_features_monthly.shift(-1).fillna(prediction_monthly[0])

        # Convert the forecasts to a dictionary
        forecast_data = {
            "Forecast for the next 3 days": predictions_daily,
            "Forecast for the next 3 weeks": predictions_weekly,
            "Forecast for the next 3 months": predictions_monthly
        }

        # Output the forecast data as JSON
        print(json.dumps(forecast_data))

    except ValueError as e:
        print(str(e))
        sys.exit(1)
