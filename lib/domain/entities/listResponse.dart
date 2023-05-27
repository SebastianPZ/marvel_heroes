
class ListResponse<T> {

  int offset;
  int limit;
  int total;
  int count;
  T results;

  ListResponse({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required this.results
  });

}