import 'package:flix_id/domain/entities/actor.dart';
import 'package:flix_id/domain/entities/result.dart';
import 'package:flix_id/domain/usecases/usecase.dart';

import '../../../data/repositories/movie_repository.dart';
import 'get_actors_param.dart';

class GetActors implements UseCase<Result<List<Actor>>, GetActorsParam> {
  final MovieRepository _movieRepository;

  GetActors({required MovieRepository movieRepository})
      : _movieRepository = movieRepository;

  @override
  Future<Result<List<Actor>>> call(GetActorsParam params) async {
    var actorListResult = await _movieRepository.getActor(id: params.movieId);

    return switch (actorListResult) {
      Success(value: final actorsList) => Result.success(actorsList),
      Failed(:final message) => Result.failed(message)
    };
  }
}
