import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pine_app/shared/models/line_item/line_item_model.dart';

import 'package:pine_app/shared/models/response.dart' as response;
import 'package:pine_app/shared/data/remote/remote.dart';
import 'package:pine_app/shared/exceptions/http_exception.dart';
import 'package:pine_app/shared/data/providers/dio_network_service_provider.dart';

final accountingServiceProvider = Provider<AccountingService>(
  (ref) {
    final NetworkService networkService = ref.watch(netwokServiceProvider);
    return AccountingService(networkService);
  },
);

class AccountingService {
  final NetworkService networkService;

  AccountingService(this.networkService);

  Future<Either<AppException, response.Response>>
      getAccountingInvoices() async {
    return networkService.get(
      '/accounting/invoices',
    );
  }

  Future<Either<AppException, response.Response>> postAccountingInvoices({
    required String invoiceNumber,
    required String customerId,
    required String date,
    required String dueDate,
    required String data,
    required String currency,
    required List<LineItem> lineItems,
  }) async {
    return networkService.post('/accounting/invoices', data: {
      'invoice_number': invoiceNumber,
      'customer_id': customerId,
      'date': date,
      'due_date': dueDate,
      'currency': currency,
      'line_items': lineItems,
    });
  }

  Future<Either<AppException, response.Response>> putAccountingInvoicesById({
    required String id,
    required String invoiceNumber,
    required String customerId,
    required String date,
    required String dueDate,
    required String data,
    required String currency,
    required List<LineItem> lineItems,
  }) async {
    return networkService.put('/accounting/invoices/$id', data: {
      'invoice_number': invoiceNumber,
      'customer_id': customerId,
      'date': date,
      'due_date': dueDate,
      'currency': currency,
      'line_items': lineItems,
    });
  }

  Future<Either<AppException, response.Response>> getAccountingInvoicesById(
      {required String id}) async {
    return networkService.get('/accounting/invoices/$id');
  }

  Future<Either<AppException, response.Response>> deleteAccountingInvoicesById(
      {required String id}) async {
    return networkService.delete('/accounting/invoices/$id');
  }

  Future<Either<AppException, response.Response>>
      postAccountingInvoicesSendById({
    required String id,
    required String email,
  }) async {
    return networkService.post('/accounting/invoices/$id/send', data: {
      'email': email,
    });
  }

  Future<Either<AppException, response.Response>>
      getAccountingExpenses() async {
    return networkService.get(
      '/accounting/expenses',
    );
  }

  Future<Either<AppException, response.Response>> postAccountingExpenses({
    required String expenseNumber,
    required String vendorId,
    required String date,
    required String dueDate,
    required String data,
    required String currency,
    required List<LineItem> lineItems,
  }) async {
    return networkService.post('/accounting/expenses', data: {
      'expense_number': expenseNumber,
      'vendor_id': vendorId,
      'date': date,
      'due_date': dueDate,
      'currency': currency,
      'line_items': lineItems,
    });
  }

  Future<Either<AppException, response.Response>> getAccountingExpensesById(
      {required String id}) async {
    return networkService.get('/accounting/expenses/$id');
  }

  Future<Either<AppException, response.Response>> putAccountingExpenses({
    required String id,
    String? expenseNumber,
    String? vendorId,
    String? date,
    String? dueDate,
    String? data,
    String? currency,
    List<LineItem>? lineItems,
  }) async {
    return networkService.post('/accounting/expenses/$id', data: {
      'expense_number': expenseNumber,
      'vendor_id': vendorId,
      'date': date,
      'due_date': dueDate,
      'currency': currency,
      'line_items': lineItems,
    });
  }

  Future<Either<AppException, response.Response>> deleteAccountingExpensesById(
      {required String id}) async {
    return networkService.delete('/accounting/expenses/$id');
  }
}
