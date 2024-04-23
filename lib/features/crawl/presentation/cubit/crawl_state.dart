part of 'crawl_cubit.dart';

abstract class CrawlState extends Equatable {
  const CrawlState();

  @override
  List<Object> get props => [];
}

class CrawlInitial extends CrawlState {}

class CrawlLoading extends CrawlState {}

class CrawlSuccess extends CrawlState {
  final CrawlQuantityEntity? quantityEntity;

  CrawlSuccess(this.quantityEntity);
}

class CrawlFailure extends CrawlState {
  final Failure failure;

  CrawlFailure(this.failure);
}
