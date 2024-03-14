import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'crawl_state.dart';

class CrawlCubit extends Cubit<CrawlState> {
  CrawlCubit() : super(CrawlInitial());
}
