part of 'crawl_cubit.dart';

abstract class CrawlState extends Equatable {
  const CrawlState();

  @override
  List<Object> get props => [];
}

class CrawlInitial extends CrawlState {}
