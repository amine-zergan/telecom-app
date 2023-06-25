// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of linearprogress;

class LinearProgress extends StatelessWidget {
  LinearProgress({
    super.key,
    this.background,
    this.value = 0.0,
    required this.begin,
    required this.end,
    required this.gradients,
    required this.duration,
    required this.curve,
    // ignore: unnecessary_null_comparison
  }) : assert(value != null && value >= 0.0 && value <= 1.0);

  double value;
  final Color? background;
  final Alignment begin;
  final Alignment end;
  final List<Color> gradients;
  final Duration duration;
  Curve curve = Curves.easeIn;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return AnimatedContainer(
          duration: duration,
          curve: curve,
          margin: const EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
          ),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: background,
                ),
              ),
              AnimatedContainer(
                duration: duration,
                curve: curve,
                height: 6,
                width: constraints.maxWidth * value,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  gradient: LinearGradient(
                    colors: gradients,
                    begin: begin,
                    end: end,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
