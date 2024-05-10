import '/core/errors/failure.dart';
import '/core/usecase/either.dart';

typedef Result<T> = Either<Failure, T>;

typedef Function0<T> = T Function();

typedef Function1<P0, R> = R Function(P0);

typedef Function2<P0, P1, R> = R Function(P0, P1);

typedef Function3<P0, P1, P2, R> = R Function(P0, P1, P2);

typedef ValueUpdated<T> = T Function(T value);

typedef ValueUpdatedOrNull<T> = T? Function(T? value);

typedef ValidateField = String? Function(String? value);
