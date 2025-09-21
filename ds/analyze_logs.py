import pandas as pd
import numpy as np
from sklearn.ensemble import IsolationForest
import matplotlib.pyplot as plt
import os

def load_logs(file_path='logs/sample_logs.csv'):
    if not os.path.exists(file_path):
        # Generate sample data if not exists
        np.random.seed(42)
        n_samples = 1000
        data = {
            'session_id': np.random.choice(['sess1', 'sess2', 'sess3'], n_samples),
            'timestamp': pd.date_range(start='2023-01-01', periods=n_samples, freq='T'),
            'draw_points': np.random.randint(1, 100, n_samples),
            'user_id': np.random.randint(1, 50, n_samples)
        }
        df = pd.DataFrame(data)
        df.to_csv(file_path, index=False)
        print(f"Generated sample logs at {file_path}")
    else:
        df = pd.read_csv(file_path)
    return df

def detect_anomalies(df):
    # Features for anomaly detection
    features = df[['draw_points', 'user_id']]
    model = IsolationForest(contamination=0.1, random_state=42)
    df['anomaly_score'] = model.fit_predict(features)
    anomalies = df[df['anomaly_score'] == -1]
    return anomalies, model

def visualize_data(df):
    plt.figure(figsize=(12, 5))
    plt.subplot(1, 2, 1)
    df.groupby('session_id')['draw_points'].sum().plot(kind='bar')
    plt.title('Draw Points per Session')
    
    plt.subplot(1, 2, 2)
    df['hour'] = pd.to_datetime(df['timestamp']).dt.hour
    df.groupby('hour')['draw_points'].mean().plot()
    plt.title('Average Activity by Hour')
    
    plt.savefig('logs/insights.png')
    plt.show()

if __name__ == "__main__":
    df = load_logs()
    anomalies, model = detect_anomalies(df)
    print(f"Detected {len(anomalies)} anomalies")
    print(anomalies.head())
    visualize_data(df)
    print("Analysis complete. Check logs/insights.png")