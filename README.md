# Currency Exchange App

This is a Flutter application that allows users to view and exchange currency rates.

## Features

- View current exchange rates for various currencies
- Convert amounts from one currency to another
- Select base and target currencies from a dropdown list
- Shows exchange rates for all available currencies

## Screenshots

![Home Screen]![image](https://github.com/Didar1313/currency_exchange_app/assets/73778140/f77f727a-9e42-4817-993c-3a33c4a9b4c8)

![Exchange Screen](
![image](https://github.com/Didar1313/currency_exchange_app/assets/73778140/379330c8-46b2-490b-be78-2ab8c210fc32)

![After Exchange Currency](![image](https://github.com/Didar1313/currency_exchange_app/assets/73778140/95836a9f-7a24-4a43-82d9-2c725c138678)
)

## Getting Started

To run this project on your local machine, follow these steps:

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- A suitable IDE (e.g., [Android Studio](https://developer.android.com/studio), [VSCode](https://code.visualstudio.com/))

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/Didar1313/currency_exchange_app.git
   cd currency_exchange_app
   
## Folder Structure

currency_exchange_app/
├── android

├── build

├── ios

├── lib

│   ├── api_service

│   │   └── apiService.dart

│   ├── component

│   │   └── all_currency.dart

│   ├── constant

│   │   └── constant.dart

│   ├── list

│   │   ├── exchange.dart

│   │   ├── home.dart

│   ├── model

│   │   └── api_model.dart

│   ├── home_page.dart

│   └── main.dart

├── test

├── .gitignore

└── pubspec.yaml


## API

const String base_url = "https://api.currencyapi.com/v3/latest?";

const String api_key = "your_api_key";

