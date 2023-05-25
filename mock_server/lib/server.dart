import 'package:alfred/alfred.dart';

class Server {
  final app = Alfred();

  Future start() async {
    app.get('/hello', (req, res) {
      return {'status': 'ok'};
    });

    //Analytics API

    app.get('/analytics/summary', (req, res) {
      final startDate = req.uri.queryParameters['start_date'];
      final endDate = req.uri.queryParameters['end_date'];
      return {
        "startDate": startDate,
        "endDate": endDate,
        "income": 12000,
        "expenses": 8000,
        "account_balances": [
          {"account_id": "12345", "balance": 15000},
          {"account_id": "67890", "balance": 5000}
        ]
      };
    });
    app.get('/analytics/income-expense', (req, res) {
      final startDate = req.uri.queryParameters['start_date'];
      final endDate = req.uri.queryParameters['end_date'];

      return {
        "startDate": startDate,
        "endDate": endDate,
        "income": [
          {
            "category": "Sales",
            "amount": 10000,
            "subcategories": [
              {"subcategory": "Product A", "amount": 6000},
              {"subcategory": "Product B", "amount": 4000}
            ]
          },
          {"category": "Investments", "amount": 2000}
        ],
        "expenses": [
          {"category": "Salaries", "amount": 5000},
          {"category": "Rent", "amount": 2000},
          {"category": "Utilities", "amount": 1000}
        ]
      };
    });

    await app.listen();
  }
}
