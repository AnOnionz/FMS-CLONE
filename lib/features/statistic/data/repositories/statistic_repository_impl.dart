import 'package:collection/collection.dart';
import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/errors/failure.dart';
import 'package:fms/core/mixins/common.dart';
import 'package:fms/core/repository/repository.dart';
import 'package:fms/core/usecase/either.dart';
import 'package:fms/features/general/presentation/page/mixin_general.dart';
import 'package:fms/features/order/data/datasources/order_local_datasource.dart';
import 'package:fms/features/statistic/data/datasources/statistic_remote_datasource.dart';

import 'package:fms/features/statistic/domain/entities/employee_entity.dart';

import 'package:fms/features/statistic/domain/entities/statistic_entity.dart';

import '../../domain/repositories/statistic_repository.dart';

class StatisticRepositoryImpl extends Repository
    with GeneralDataMixin
    implements StatisticRepository {
  final StatisticRemoteDataSource _remote;
  final OrderLocalDataSource _local;

  StatisticRepositoryImpl(this._remote, this._local);

  @override
  Future<Result<StatisticEntity>> fetchEmployeeStatistic(
      {required int featureId, required int employeeId}) {
    return todo(() async {
      final statistic = await _remote.fetchTeamStatistic(
          featureId: featureId, employeeId: employeeId);
      if (statistic == null) {
        return Left(DataNullFailure());
      }
      return Right(statistic);
    });
  }

  @override
  Future<Result<StatisticEntity>> fetchIndividualStatistic(
      {required int featureId, bool isOnline = true}) {
    return todo(() async {
      StatisticEntity? statistic;
      if (isOnline) {
        statistic =
            await _remote.fetchIndividualStatistic(featureId: featureId);
      } else {
        final orders = await _local.getOrders();
        final ordersPurchases = orders
            .map((order) => (order.purchases ?? []).map((purchase) =>
                PurchaseStatistic(
                    product: purchase.product,
                    productPackaging: purchase.productPackaging,
                    quantity: purchase.quantity)))
            .expand((element) => element);
        final orderExchanges = orders
            .map((order) => (order.exchanges ?? []).map((exchange) {
                  final gifts = (exchange.exchangeProceeds ?? []).map((e) =>
                      ExchangeStatistic(
                          item: e.item,
                          product: e.product,
                          productPackaging: e.productPackaging,
                          quantity: e.quantity));
                  return gifts;
                }).expand((element) => element))
            .expand((element) => element);
        final orderSamplings = orders
            .map((order) => (order.samplings ?? []).map((sampling) =>
                SamplingStatistic(
                    product: sampling.product,
                    productPackaging: sampling.productPackaging,
                    quantity: sampling.quantity)))
            .expand((element) => element);

        final purchases = <PurchaseStatistic>[];
        ordersPurchases.forEach((element) {
          if (purchases.contains(element)) {
            final purchase = purchases.firstWhere((value) =>
                value.product == element.product &&
                value.productPackaging == element.productPackaging);
            purchases.remove(purchase);
            purchases.add(purchase.copyWith(
                quantity: purchase.quantity! + element.quantity!));
          } else {
            purchases.add(element);
          }
        });

        final samplings = <SamplingStatistic>[];
        orderSamplings.forEach((element) {
          if (samplings.contains(element)) {
            final purchase = samplings.firstWhere((value) =>
                value.product == element.product &&
                value.productPackaging == element.productPackaging);
            samplings.remove(purchase);
            samplings.add(purchase.copyWith(
                quantity: purchase.quantity! + element.quantity!));
          } else {
            samplings.add(element);
          }
        });
        statistic = StatisticEntity(
            purchases:
                purchases.sorted((a, b) => b.product!.id! - a.product!.id!),
            exchanges: [],
            samplings:
                samplings.sorted((a, b) => b.product!.id! - a.product!.id!));
      }
      if (statistic == null) {
        return Left(DataNullFailure());
      }
      return Right(statistic);
    });
  }

  @override
  Future<Result<List<EmployeeEntity>>> fetchTeamMembers(
      {required int featureId}) {
    return todo(() async {
      final members = await _remote.fetchTeamMembers(featureId: featureId);

      return Right(members);
    });
  }

  @override
  Future<Result<StatisticEntity>> fetchTeamStatistic({required int featureId}) {
    return todo(() async {
      final statistic = await _remote.fetchTeamStatistic(featureId: featureId);
      if (statistic == null) {
        return Left(DataNullFailure());
      }
      return Right(statistic);
    });
  }
}
