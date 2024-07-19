
extension GenericExtension<T> on T {
  R let<R>(R Function(T that) output) => output(this);
}
